import { privateApi } from '@/api/api'
import { routeStore } from '@/store/route-store'
import loggers from '@/utils/loggers'
import notifee, { AndroidImportance } from '@notifee/react-native'
import * as Location from 'expo-location'
import * as TaskManager from 'expo-task-manager'

const LOCATION_TASK_NAME = 'background-location-task'
const NOTIFICATION_ID = 'timer-notification'

const log = loggers.backgroundLocation

TaskManager.defineTask(LOCATION_TASK_NAME, async ({ data, error }) => {
  log.debug('Tarea ejecutada en background')
  if (error) {
    log.error('Error en tarea de ubicación:', error)
    return
  }

  if (data) {
    const { locations } = data as { locations: Location.LocationObject[] }
    const location = locations[0]

    if (location) {
      try {
        const routeId = await routeStore.getRouteId()
        if (!routeId) {
          log.debug('No hay ruta activa')
          return
        }

        privateApi.post('/driver/route/point', {
          route_id: routeId,
          latitude: location.coords.latitude,
          longitude: location.coords.longitude,
        })
        log.debug('Ubicación enviada en background')

        const startTs = await routeStore.getStartTimestamp()
        if (startTs) {
          const channelId = await notifee.createChannel({
            id: 'timer-route-channel',
            name: 'Progreso de Ruta',
            importance: AndroidImportance.HIGH,
          })

          await notifee.displayNotification({
            id: NOTIFICATION_ID,
            title: 'Ruta activa',
            body: 'Tiempo transcurrido',
            android: {
              channelId,
              ongoing: true,
              onlyAlertOnce: true,
              showChronometer: true,
              chronometerDirection: 'up',
              timestamp: startTs,
            },
          })
          log.debug('Notificación actualizada')
        } else {
          log.debug('Sin timestamp de inicio')
        }
      } catch (error) {
        log.error('Error en tarea:', error)
      }
    }
  }
})

export const startBackgroundTracking = async () => {
  try {
    const { status: foregroundStatus } = await Location.requestForegroundPermissionsAsync()
    if (foregroundStatus !== 'granted') {
      log.warn('Permiso de foreground denegado')
      return
    }

    const { status: backgroundStatus } = await Location.requestBackgroundPermissionsAsync()
    if (backgroundStatus !== 'granted') {
      log.warn('Permiso de background denegado')
      return
    }

    const isDefined = TaskManager.isTaskDefined(LOCATION_TASK_NAME)
    log.debug('Tarea definida?', isDefined)
    if (!isDefined) {
      throw new Error('La tarea no está definida')
    }

    await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
      accuracy: Location.Accuracy.Balanced,
      timeInterval: 20000,
      distanceInterval: 10,
      foregroundService: {
        notificationTitle: 'Registrando tu progreso',
        notificationBody: 'CleanFlow está registrando tu ruta',
        notificationColor: '#2196F3',
      },
    })
    log.debug('Rastreo en background iniciado')
  } catch (error) {
    log.error('Error al iniciar rastreo en background:', error)
  }
}

export const stopBackgroundTracking = async () => {
  try {
    await Location.stopLocationUpdatesAsync(LOCATION_TASK_NAME)
  } catch (error: any) {
    log.debug('Location task no estaba activa:', error)
  }

  try {
    await notifee.cancelNotification(NOTIFICATION_ID)
  } catch (error: any) {
    log.debug('Notification no existía:', error)
  }

  log.debug('Rastreo en background detenido')
}
