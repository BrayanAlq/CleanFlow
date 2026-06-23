import { DEFAULT_LOCATION } from '@/constants/location'
import { getCurrentLocation, watchPositionAsync } from '@/services/location'
import { useEffect, useState } from 'react'

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
    let unsubscribe: (() => void) | null = null // ✅ Ya está bien aquí

    const initializeLocation = async () => {
      try {
        console.log('[HOOK_CURRENT_POSITION] [1] Iniciando initialization...')

        const initialLocation = await getCurrentLocation()
        console.log('[HOOK_CURRENT_POSITION] [2] getCurrentLocation completo')

        if (!initialLocation) {
          console.log('[HOOK_CURRENT_POSITION] [3] initialLocation es null/undefined')
          setError('Sin permiso de ubicación')
          return
        }

        console.log('[HOOK_CURRENT_POSITION] [4] Tenemos ubicación inicial:', initialLocation.coords)
        setLocation({
          longitude: initialLocation.coords.longitude,
          latitude: initialLocation.coords.latitude,
        })
        setHasRealLocation(true)
        console.log('[HOOK_CURRENT_POSITION] [5] setHasRealLocation(true) ejecutado')

        // 🔥 AQUÍ ASIGNAS watchPositionAsync
        unsubscribe = await watchPositionAsync(
          position => {
            console.log('[HOOK_CURRENT_POSITION] Watch - Nueva posición:', position.coords)
            setLocation({
              longitude: position.coords.longitude,
              latitude: position.coords.latitude,
            })
          },
          err => {
            console.error('[HOOK_CURRENT_POSITION] Watch error:', err.message)
            setError(err.message)
          },
        )
        console.log('[HOOK_CURRENT_POSITION] [6] Watch iniciado')
      } catch (err) {
        console.error('[HOOK_CURRENT_POSITION] [ERROR]', err)
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
