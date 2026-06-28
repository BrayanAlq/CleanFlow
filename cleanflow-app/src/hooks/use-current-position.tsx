import { DEFAULT_LOCATION } from '@/constants/location'
import { getCurrentLocation, watchPositionAsync } from '@/services/location'
import loggers from '@/utils/loggers'
import { useEffect, useState } from 'react'

const log = loggers.hookCurrentLocation

interface LocationState {
  longitude: number
  latitude: number
}

export const useCurrentPosition = () => {
  const [hasRealLocation, setHasRealLocation] = useState<boolean>(false)
  const [location, setLocation] = useState<LocationState>({
    longitude: DEFAULT_LOCATION.longitude,
    latitude: DEFAULT_LOCATION.latitude,
  })
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let unsubscribe: (() => void) | null = null

    const initializeLocation = async () => {
      try {
        log.debug('[1] Iniciando hookCurrentLocation')

        const initialLocation = await getCurrentLocation()
        log.debug('[2] getCurrentLocation completo')

        if (!initialLocation) {
          log.debug('[3] initialLocation es null/undefined')
          setError('Sin permiso de ubicación')
          return
        }

        log.debug('[4] Tenemos ubicación inicial:', initialLocation.coords)
        setLocation({
          longitude: initialLocation.coords.longitude,
          latitude: initialLocation.coords.latitude,
        })
        setHasRealLocation(true)
        log.debug('[5] setHasRealLocation(true) ejecutado')

        // 🔥 AQUÍ ASIGNAS watchPositionAsync
        unsubscribe = await watchPositionAsync(
          position => {
            log.debug('Watch - Nueva posición:', position.coords)
            setLocation({
              longitude: position.coords.longitude,
              latitude: position.coords.latitude,
            })
          },
          err => {
            log.error('Watch error:', err.message)
            setError(err.message)
          },
        )
        log.debug('[6] Watch iniciado')
      } catch (err) {
        log.error('[ERROR]', err)
        setHasRealLocation(false)
      }
    }

    initializeLocation()

    return () => {
      if (unsubscribe) {
        unsubscribe()
      }
    }
  }, [])

  return { hasRealLocation, location, error }
}
