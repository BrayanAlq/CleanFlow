import notifee, { AndroidImportance } from '@notifee/react-native'
import { useEffect } from 'react'

interface UseNotificationProps {
  isActive: boolean
  options: {
    title: string
    body: string
  }
  startTimestamp: number | null
}

const NOTIFICATION_ID = 'timer-notification'

notifee.registerForegroundService(() => new Promise(() => {}))
notifee.onBackgroundEvent(async () => {})

export const useLocalNotification = ({
  isActive,
  options,
  startTimestamp,
}: UseNotificationProps) => {
  useEffect(() => {
    if (!isActive || !startTimestamp) {
      notifee.cancelNotification(NOTIFICATION_ID)
      notifee.stopForegroundService().catch(() => {})
      return
    }

    const init = async () => {
      try {
        const channelId = await notifee.createChannel({
          id: 'timer-route-channel',
          name: 'Progreso de Ruta',
          importance: AndroidImportance.HIGH,
          vibration: true,
          sound: 'default',
        })

        await notifee.displayNotification({
          id: NOTIFICATION_ID,
          title: options.title,
          body: options.body,
          android: {
            channelId,
            asForegroundService: true,
            smallIcon: 'ic_launcher',
            ongoing: true,
            onlyAlertOnce: true,
            showChronometer: true,
            chronometerDirection: 'up',
            timestamp: startTimestamp,
          },
        })
      } catch (err) {
        console.error('[LOCAL_NOTIFICATION] Error:', err)
      }
    }

    init()
  }, [isActive, options, startTimestamp])

  const dismiss = async () => {
    await notifee.cancelNotification(NOTIFICATION_ID)
    await notifee.stopForegroundService().catch(() => {})
  }

  return { dismiss }
}
