import Constants from 'expo-constants';
import * as Notifications from 'expo-notifications';
import { useEffect, useState } from 'react';
import { Platform } from 'react-native';

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldPlaySound: true,
    shouldSetBadge: true,
    shouldShowBanner: true,
    shouldShowList: true,
  })
})

const handleRegistrationError = (errorMessage: string) => {
  alert(errorMessage);
  throw new Error(errorMessage);
}

const registerForPushNotificationsAsync = async () => {
  if (Platform.OS === 'android') {
    await Notifications.setNotificationChannelAsync('default', {
      name: 'default',
      importance: Notifications.AndroidImportance.MAX,
      vibrationPattern: [0, 250, 250, 250],
      lightColor: '#FF231F7C',
    })
  }

  const { status: existingStatus } = await Notifications.getPermissionsAsync();
  let finalStatus = existingStatus;
  if (existingStatus !== 'granted') {
    const { status } = await Notifications.requestPermissionsAsync();
    finalStatus = status;
  }
  if (finalStatus !== 'granted') {
    handleRegistrationError('Permission not granted to get push token for push notification!');
    return;
  }

  const projectId = Constants.expoConfig?.extra?.eas?.projectId ?? Constants.easConfig?.projectId;
  if (!projectId) {
    handleRegistrationError('Project ID not found in eas.json!');
  }

  try {
    const pushTokenString = (await Notifications.getExpoPushTokenAsync({ projectId })).data;
    return pushTokenString;
  } catch (error: unknown) {
    handleRegistrationError(`${error}`);
  }
}

export const usePushNotification = () => {
  const [token, setToken] = useState('');

  useEffect(() => {
    const registerDevice = async () => {
      const token = await registerForPushNotificationsAsync();
      setToken(token ?? '');
    }
    registerDevice();
  }, [])

  return {
    token
  }
}