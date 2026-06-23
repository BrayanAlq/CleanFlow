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

let foregroundServiceRegistered = false

const registerForegroundService = () => {
  if (foregroundServiceRegistered) return
  foregroundServiceRegistered = true

  notifee.registerForegroundService(() => {
    return new Promise(() => {})
  })
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
        registerForegroundService()
      } catch (err) {
        console.error('Error pidiendo permisos:', err)
      }
    }

    initializeNotifee()
  }, [])

  useEffect(() => {
    if (!isActive) {
      if (intervalRef.current) {
        clearInterval(intervalRef.current)
        intervalRef.current = null
      }
      if (notificationIdRef.current) {
        notifee.cancelNotification(notificationIdRef.current)
        notificationIdRef.current = null
      }
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
            if (notificationIdRef.current) {
              await notifee.displayNotification({
                id: notificationIdRef.current,
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
            } else {
              const id = await notifee.displayNotification({
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
              notificationIdRef.current = id
            }
          } catch (err) {
            console.error('Error mostrando notificación:', err)
          }
        }

        await displayNotification()

        intervalRef.current = setInterval(() => {
          displayNotification()
        }, updateInterval)
      } catch (err) {
        console.error('Error inicializando channel:', err)
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
    if (notificationIdRef.current) {
      await notifee.cancelNotification(notificationIdRef.current)
      notificationIdRef.current = null
    }
  }

  return { dismiss }
}
