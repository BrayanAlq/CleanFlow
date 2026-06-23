import { DEFAULT_LOCATION } from '@/constants/location'
import { getCurrentLocation, watchPositionAsync } from '@/services/location'
import { useEffect, useState } from 'react'

export const useCurrentPosition = () => {
  const [hasRealLocation, setHasRealLocation] = useState(false)
  const [location, setLocation] = useState({
    longitude: DEFAULT_LOCATION.longitude,
    latitude: DEFAULT_LOCATION.latitude,
  })
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let unsubscribe: (() => void) | null = null

    const initializeLocation = async () => {
      try {
        const initialLocation = await getCurrentLocation()
        if (initialLocation) {
          setLocation({
            longitude: initialLocation.coords.longitude,
            latitude: initialLocation.coords.latitude,
          })
          setHasRealLocation(true) // ✓ Primera vez
          setError(null)
        } else {
          setError('Permiso de ubicación no concedido')
          return
        }

        unsubscribe = await watchPositionAsync(
          position => {
            setLocation({
              longitude: position.coords.longitude,
              latitude: position.coords.latitude,
            })
            // No necesitas setHasRealLocation aquí si ya es true
          },
          err => {
            console.error('Error watching position:', err.message)
            setError(err.message)
            // ⭐ REMOVEMOS: setHasRealLocation(false)
            // Si ya obtuviste ubicación inicial, no vuelvas a false
          },
        )
      } catch (err) {
        const errorMsg = err instanceof Error ? err.message : 'Error desconocido'
        console.error('Location error:', errorMsg)
        setError(errorMsg)
        setHasRealLocation(false) // Solo aquí si falla TODO
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
