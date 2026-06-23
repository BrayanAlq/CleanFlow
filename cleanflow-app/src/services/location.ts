import * as Location from 'expo-location'

export const getCurrentLocation = async () => {
  try {
    console.log('[LOCATION_SERVICE] Checando permisos foreground...')
    const { status: fgStatus } = await Location.getForegroundPermissionsAsync()
    console.log('[LOCATION_SERVICE] Foreground status:', fgStatus)

    if (fgStatus !== 'granted') {
      console.log('[LOCATION_SERVICE] Pidiendo foreground...')
      const { status } = await Location.requestForegroundPermissionsAsync()
      if (status !== 'granted') {
        console.log('[LOCATION_SERVICE] Foreground denegado')
        return null
      }
    }

    console.log('[LOCATION_SERVICE] Checando permisos background...')
    const { status: bgStatus } = await Location.getBackgroundPermissionsAsync()
    console.log('[LOCATION_SERVICE] Background status:', bgStatus)

    if (bgStatus !== 'granted') {
      console.log('[LOCATION_SERVICE] Pidiendo background...')
      await Location.requestBackgroundPermissionsAsync()
    }

    console.log('[LOCATION_SERVICE] Permisos OK, checando GPS...')
    const enabled = await Location.hasServicesEnabledAsync()
    console.log('[LOCATION_SERVICE] GPS enabled:', enabled)

    if (!enabled) {
      throw new Error('[LOCATION_SERVICE] GPS deshabilitado')
    }

    console.log('[LOCATION_SERVICE] Obteniendo posición...')
    const position = await Location.getCurrentPositionAsync({
      accuracy: Location.Accuracy.Balanced,
    })
    console.log('[LOCATION_SERVICE] Posición obtenida:', position.coords)
    return position
  } catch (err) {
    console.error('[LOCATION_SERVICE] Error en getCurrentLocation:', err)
    throw err
  }
}

export const watchPositionAsync = async (
  callback: (location: Location.LocationObject) => void,
  onError: (error: Error) => void,
) => {
  const { status } = await Location.requestForegroundPermissionsAsync()
  if (status !== 'granted') {
    onError(new Error('[LOCATION_SERVICE] Permiso de ubicación denegado'))
    return () => {}
  }

  const enabled = await Location.hasServicesEnabledAsync()
  if (!enabled) {
    onError(new Error('[LOCATION_SERVICE] GPS deshabilitado'))
    return () => {}
  }

  const subscription = await Location.watchPositionAsync(
    {
      accuracy: Location.Accuracy.Balanced,
      timeInterval: 20000,
      distanceInterval: 0,
    },
    callback,
  )

  return () => subscription.remove()
}
