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
