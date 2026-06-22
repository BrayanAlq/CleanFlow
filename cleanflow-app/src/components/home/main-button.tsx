import { useStompContext } from '@/context/stomp-context'
import { useCurrentPosition } from '@/hooks/use-current-position'
import { useCreateRoute, useFinishRoute, useGetPointsByRoute } from '@/hooks/use-route'
import { useTheme } from '@/hooks/use-theme'
import polyline from '@mapbox/polyline'
import { useEffect, useRef, useState } from 'react'
import { Pressable, StyleSheet } from 'react-native'
import { ThemedText } from '../themed-text'

type ButtonStatus = 'initial' | 'active' | 'finishing'

export const MainButton = () => {
  const [status, setStatus] = useState<ButtonStatus>('initial')
  const [routeId, setRouteId] = useState<number | null>(null)

  const theme = useTheme()
  const { createRouteMutation } = useCreateRoute()
  // useGetPointsByRoute(id) -> id that returns in response of createRouteMutation
  const { data: points, isLoading: isLoadingPoints } = useGetPointsByRoute(status === 'finishing' ? routeId : null)
  const { finishRouteMutation } = useFinishRoute()
  const { publish } = useStompContext()
  const { location, hasRealLocation } = useCurrentPosition()

  const locationRef = useRef(location)
  const routeIdRef = useRef(routeId)
  const hasRealLocationRef = useRef(hasRealLocation)

  useEffect(() => {
    locationRef.current = location
  }, [location])

  useEffect(() => {
    routeIdRef.current = routeId
  }, [routeId])

  useEffect(() => {
    hasRealLocationRef.current = hasRealLocation
  }, [hasRealLocation])

  useEffect(() => {
    if (status !== 'active') return

    const interval = setInterval(() => {
      if (routeIdRef.current && locationRef.current && hasRealLocationRef.current) {
        publish('/app/driver.location', {
          route_id: routeIdRef.current,
          longitude: locationRef.current.longitude,
          latitude: locationRef.current.latitude,
        })
      }
    }, 3000) // Cada 3 segundos

    return () => {
      clearInterval(interval)
    }
  }, [status, publish])

  useEffect(() => {
    if (status === 'finishing' && points && !isLoadingPoints) {
      finishRoute()
    }
  }, [points, isLoadingPoints, status])

  const handleInitialPress = async () => {
    try {
      const response = await createRouteMutation.mutateAsync()
      setRouteId(response.id)
      setStatus('active')
    } catch (err) {
      console.error('Error al crear ruta:', err)
    }
  }

  const handleFinishedPress = async () => {
    setStatus('finishing')
  }

  const finishRoute = async () => {
    if (!routeId || !points) return

    const arrayPoints = points.map(p => [p.latitude, p.longitude]) as [number, number][]
    const pl = polyline.encode(arrayPoints)

    try {
      await finishRouteMutation.mutateAsync({
        route_id: routeId,
        polyline: pl,
      })
      // Reset for next route
      setStatus('initial')
      setRouteId(null)
    } catch (error) {
      console.error('Error al terminar ruta:', error)
      setStatus('active') // Return to active state if there is an error
    }
  }

  return (
    <Pressable
      onPress={status === 'initial' ? handleInitialPress : handleFinishedPress}
      disabled={status === 'finishing'}
      style={[styles.container, { backgroundColor: theme?.greenAccent }]}
    >
      <ThemedText style={styles.text}>{status === 'initial' ? 'Comenzar' : 'Terminar'}</ThemedText>
    </Pressable>
  )
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
    elevation: 1,
    borderRadius: 16,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 24,
  },
})
