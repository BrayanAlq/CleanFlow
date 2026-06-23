import notifee, { AndroidImportance } from '@notifee/react-native'
import { useEffect, useRef } from 'react'

interface UseNotificationProps {
  isActive: boolean
  options: {
    title: string
    body: string
    priority?: 'high' | 'default' | 'low'
  }
  variables?: Record<string, string | number>
  updateInterval?: number
}

export const useLocalNotification = ({
  isActive,
  options,
  variables = {},
  updateInterval = 1000,
}: UseNotificationProps) => {
  const notificationIdRef = useRef<string | null>(null)
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)

  useEffect(() => {
    const initializeNotifee = async () => {
      try {
        await notifee.requestPermission()
      } catch (err) {
        console.error('Error pidiendo permisos:', err)
      }
    }

    initializeNotifee()
  }, [])

  useEffect(() => {
    if (!isActive) {
      // ✅ Limpia todo cuando se desactiva
      if (intervalRef.current) {
        clearInterval(intervalRef.current)
        intervalRef.current = null
      }
      if (notificationIdRef.current) {
        notifee.cancelNotification(notificationIdRef.current)
        notificationIdRef.current = null // ✅ Resetea el ref
      }
      return
    }

    const createChannelAndDisplay = async () => {
      try {
        // Crea el channel cada vez (idempotente, no hay problema)
        const channelId = await notifee.createChannel({
          id: 'timer-route-channel',
          name: 'Progreso de Ruta',
          importance: AndroidImportance.HIGH,
          vibration: true,
          sound: 'default',
        })

        // Muestra la notificación
        const displayNotification = async () => {
          let body = options.body
          Object.entries(variables).forEach(([key, value]) => {
            body = body.replace(`{{${key}}}`, String(value))
          })

          try {
            // ✅ Si ya existe, actualiza por ID
            if (notificationIdRef.current) {
              await notifee.displayNotification({
                id: notificationIdRef.current,
                title: options.title,
                body,
                android: {
                  channelId,
                  smallIcon: 'ic_launcher',
                  ongoing: true,
                  onlyAlertOnce: true,
                },
              })
            } else {
              // ✅ Primera vez, crea nueva
              const id = await notifee.displayNotification({
                title: options.title,
                body,
                android: {
                  channelId,
                  smallIcon: 'ic_launcher',
                  ongoing: true,
                  onlyAlertOnce: true,
                },
              })
              notificationIdRef.current = id
            }
          } catch (err) {
            console.error('Error mostrando notificación:', err)
          }
        }

        // Muestra inmediatamente
        await displayNotification()

        // Actualiza periódicamente
        intervalRef.current = setInterval(() => {
          displayNotification()
        }, updateInterval)
      } catch (err) {
        console.error('Error inicializando channel:', err)
      }
    }

    createChannelAndDisplay()

    return () => {
      // Limpia el intervalo
      if (intervalRef.current) {
        clearInterval(intervalRef.current)
        intervalRef.current = null
      }
    }
  }, [isActive, options, variables, updateInterval])

  const dismiss = async () => {
    if (intervalRef.current) {
      clearInterval(intervalRef.current)
      intervalRef.current = null
    }
    if (notificationIdRef.current) {
      await notifee.cancelNotification(notificationIdRef.current)
      notificationIdRef.current = null
    }
  }

  return { dismiss }
}
