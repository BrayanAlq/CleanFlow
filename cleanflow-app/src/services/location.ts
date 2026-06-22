import * as Location from 'expo-location'

export const getCurrentLocation = async () => {
  const { status } = await Location.requestForegroundPermissionsAsync()
  if (status !== 'granted') {
    return null
  }

  const enabled = await Location.hasServicesEnabledAsync()
  if (!enabled) {
    throw new Error('GPS deshabilitado')
  }

  return await Location.getCurrentPositionAsync({
    accuracy: Location.Accuracy.Balanced,
  })
}

export const watchPositionAsync = async (
  callback: (location: Location.LocationObject) => void,
  onError: (error: Error) => void,
) => {
  const { status } = await Location.requestForegroundPermissionsAsync()
  if (status !== 'granted') {
    onError(new Error('Permiso de ubicación denegado'))
    return () => {}
  }

  const enabled = await Location.hasServicesEnabledAsync()
  if (!enabled) {
    onError(new Error('GPS deshabilitado'))
    return () => {}
  }

  const subscription = await Location.watchPositionAsync(
    {
      accuracy: Location.Accuracy.Balanced,
      timeInterval: 500, // update every 500ms
      distanceInterval: 10,
    },
    callback,
  )

  return () => subscription.remove()
}
