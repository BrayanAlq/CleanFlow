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

const NOTIFICATION_ID = 'timer-notification'

notifee.registerForegroundService(() => new Promise(() => {}))
notifee.onBackgroundEvent(async () => {})

export const useLocalNotification = ({
  isActive,
  options,
  variables = {},
  updateInterval = 1000,
}: UseNotificationProps) => {
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)

  useEffect(() => {
    if (!isActive) {
      if (intervalRef.current) {
        clearInterval(intervalRef.current)
        intervalRef.current = null
      }
      notifee.cancelNotification(NOTIFICATION_ID)
      notifee.stopForegroundService().catch(() => {})
      return
    }

    const createChannelAndDisplay = async () => {
      try {
        const channelId = await notifee.createChannel({
          id: 'timer-route-channel',
          name: 'Progreso de Ruta',
          importance: AndroidImportance.HIGH,
          vibration: true,
          sound: 'default',
        })

        const displayNotification = async () => {
          let body = options.body
          Object.entries(variables).forEach(([key, value]) => {
            body = body.replace(`{{${key}}}`, String(value))
          })

          try {
            await notifee.displayNotification({
              id: NOTIFICATION_ID,
              title: options.title,
              body,
              android: {
                channelId,
                asForegroundService: true,
                smallIcon: 'ic_launcher',
                ongoing: true,
                onlyAlertOnce: true,
              },
            })
          } catch (err) {
            console.error('[LOCAL_NOTIFICATION] Error mostrando notificación:', err)
          }
        }

        await displayNotification()

        intervalRef.current = setInterval(() => {
          displayNotification()
        }, updateInterval)
      } catch (err) {
        console.error('[LOCAL_NOTIFICATION] Error inicializando channel:', err)
      }
    }

    createChannelAndDisplay()

    return () => {
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
    await notifee.cancelNotification(NOTIFICATION_ID)
    await notifee.stopForegroundService().catch(() => {})
  }

  return { dismiss }
}
