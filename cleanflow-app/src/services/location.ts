import loggers from '@/utils/loggers'
import * as Location from 'expo-location'

const log = loggers.location

export const getCurrentLocation = async () => {
  try {
    log.debug('Checando permisos foreground...')
    const { status: fgStatus } = await Location.getForegroundPermissionsAsync()
    log.debug('Foreground status:', fgStatus)

    if (fgStatus !== 'granted') {
      log.debug('Pidiendo foreground...')
      const { status } = await Location.requestForegroundPermissionsAsync()
      if (status !== 'granted') {
        log.debug('Foreground denegado')
        return null
      }
    }

    log.debug('Checando permisos background...')
    const { status: bgStatus } = await Location.getBackgroundPermissionsAsync()
    log.debug('Background status:', bgStatus)

    if (bgStatus !== 'granted') {
      log.debug('Pidiendo background...')
      await Location.requestBackgroundPermissionsAsync()
    }

    log.debug('Permisos OK, checando GPS...')
    const enabled = await Location.hasServicesEnabledAsync()
    log.debug('GPS enabled:', enabled)

    if (!enabled) {
      throw new Error('[LOCATION_SERVICE] GPS deshabilitado')
    }

    log.debug('Obteniendo posición...')
    const position = await Location.getCurrentPositionAsync({
      accuracy: Location.Accuracy.Balanced,
    })
    log.debug('Posición obtenida:', position.coords)
    return position
  } catch (err) {
    log.error('Error en getCurrentLocation:', err)
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
      timeInterval: 10000,
      distanceInterval: 0,
    },
    callback,
  )

  return () => subscription.remove()
}
