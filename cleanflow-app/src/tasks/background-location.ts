import { privateApi } from '@/api/api'
import { routeStore } from '@/store/route-store'
import notifee, { AndroidImportance } from '@notifee/react-native'
import * as Location from 'expo-location'
import * as TaskManager from 'expo-task-manager'

const LOCATION_TASK_NAME = 'background-location-task'

TaskManager.defineTask(LOCATION_TASK_NAME, async ({ data, error }) => {
  console.log('[BACKGROUND_SERVICE] Tarea ejecutada en background')
  if (error) {
    console.error('[BACKGROUND_SERVICE] Error en tarea de ubicación:', error)
    return
  }

  if (data) {
    const { locations } = data as { locations: Location.LocationObject[] }
    const location = locations[0]

    if (location) {
      try {
        const routeId = await routeStore.getRouteId()
        if (!routeId) {
          console.log('[BACKGROUND_SERVICE] No hay ruta activa')
          return
        }

        privateApi.post('/driver/route/point', {
          route_id: routeId,
          latitude: location.coords.latitude,
          longitude: location.coords.longitude,
        })
        console.log('[BACKGROUND_SERVICE] Ubicación enviada en background')

        const startTs = await routeStore.getStartTimestamp()
        if (startTs) {
          const elapsed = Math.floor((Date.now() - startTs) / 1000)
          const m = Math.floor(elapsed / 60)
          const s = elapsed % 60
          const timerStr = `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`

          const channelId = await notifee.createChannel({
            id: 'timer-route-channel',
            name: 'Progreso de Ruta',
            importance: AndroidImportance.HIGH,
          })

          await notifee.displayNotification({
            id: 'timer-notification',
            title: 'Ruta activa',
            body: `Progreso: ${timerStr}`,
            android: {
              channelId,
              ongoing: true,
              onlyAlertOnce: true,
            },
          })
          console.log('[BACKGROUND_SERVICE] Notificación actualizada:', timerStr)
        } else {
          console.log('[BACKGROUND_SERVICE] Sin timestamp de inicio')
        }
      } catch (error) {
        console.error('[BACKGROUND_SERVICE] Error en tarea:', error)
      }
    }
  }
})

export const startBackgroundTracking = async () => {
  try {
    const { status: foregroundStatus } = await Location.requestForegroundPermissionsAsync()
    if (foregroundStatus !== 'granted') {
      console.warn('[BACKGROUND_SERVICE] Permiso de foreground denegado')
      return
    }

    const { status: backgroundStatus } = await Location.requestBackgroundPermissionsAsync()
    if (backgroundStatus !== 'granted') {
      console.warn('[BACKGROUND_SERVICE] Permiso de background denegado')
      return
    }

    const isDefined = TaskManager.isTaskDefined(LOCATION_TASK_NAME)
    console.log('[BACKGROUND_SERVICE] Tarea definida?', isDefined)
    if (!isDefined) {
      throw new Error('La tarea no está definida')
    }

    await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
      accuracy: Location.Accuracy.Balanced,
      timeInterval: 30000,
      distanceInterval: 10,
      foregroundService: {
        notificationTitle: 'Registrando tu progreso',
        notificationBody: 'CleanFlow está registrando tu ruta',
        notificationColor: '#2196F3',
      },
    })
    console.log('[BACKGROUND_SERVICE] Rastreo en background iniciado')
  } catch (error) {
    console.error('[BACKGROUND_SERVICE] Error al iniciar rastreo en background:', error)
  }
}

export const stopBackgroundTracking = async () => {
  await Location.stopLocationUpdatesAsync(LOCATION_TASK_NAME)
  console.log('[BACKGROUND_SERVICE] Rastreo en background detenido')
}
