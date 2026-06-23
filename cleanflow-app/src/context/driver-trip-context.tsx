import { useStompContext } from '@/context/stomp-context'
import { useCurrentPosition } from '@/hooks/use-current-position'
import { useLocalNotification } from '@/hooks/use-local-notification'
import { useCreateRoute, useFinishRoute, useGetPointsByRoute } from '@/hooks/use-route'
import { formatTime } from '@/utils/time-formatter'
import polyline from '@mapbox/polyline'
import { useQueryClient } from '@tanstack/react-query'
import { createContext, ReactNode, useContext, useEffect, useRef, useState } from 'react'

type ButtonStatus = 'initial' | 'active' | 'finishing'

interface DriverTripContextValue {
  status: ButtonStatus
  routeId: number | null
  timer: number
  startRoute: () => Promise<void>
  finishRoute: () => void
}

const DriverTripContext = createContext<DriverTripContextValue | null>(null)

export const DriverTripProvider = ({ children }: { children: ReactNode }) => {
  const [status, setStatus] = useState<ButtonStatus>('initial')
  const [routeId, setRouteId] = useState<number | null>(null)
  const [timer, setTimer] = useState<number>(0)

  const { createRouteMutation } = useCreateRoute()
  const { data: points, isLoading: isLoadingPoints } = useGetPointsByRoute(status === 'finishing' ? routeId : null)
  const { finishRouteMutation } = useFinishRoute()
  const { publish } = useStompContext()
  const { location, hasRealLocation } = useCurrentPosition()
  const queryClient = useQueryClient()

  const { dismiss: dismissNotification } = useLocalNotification({
    isActive: status === 'active',
    options: {
      title: 'Registrando su progreso',
      body: 'Tiempo: {{timer}}',
      priority: 'high',
    },
    variables: { timer: formatTime(timer) },
    updateInterval: 1000,
  })

  const locationRef = useRef(location)
  const routeIdRef = useRef(routeId)
  const hasRealLocationRef = useRef(hasRealLocation)

  useEffect(() => {
    locationRef.current = location
  }, [location])

  useEffect(() => {
    routeIdRef.current = routeId

    if (routeId) {
      console.log('🔄 New route created, refs ready')
    }
  }, [routeId])

  useEffect(() => {
    hasRealLocationRef.current = hasRealLocation
  }, [hasRealLocation])

  useEffect(() => {
    if (status !== 'active') return

    const timeInterval = setInterval(() => {
      setTimer(prev => prev + 1)
    }, 1000)

    return () => {
      clearInterval(timeInterval)
    }
  }, [status])

  useEffect(() => {
    if (status !== 'active') return

    const interval = setInterval(() => {
      const canPublish = routeIdRef.current && locationRef.current && hasRealLocationRef.current

      if (!canPublish) {
        console.log('❌ Cannot publish:', {
          routeId: routeIdRef.current ? '✓' : '✗',
          location: locationRef.current ? `[${locationRef.current.latitude}, ${locationRef.current.longitude}]` : '✗',
          hasRealLocation: hasRealLocationRef.current ? '✓' : '✗',
        })
        return
      }

      console.log('✅ Publishing location')
      publish('/app/driver.location', {
        route_id: routeIdRef.current,
        longitude: locationRef.current.longitude,
        latitude: locationRef.current.latitude,
      })
    }, 3000)

    return () => {
      clearInterval(interval)
    }
  }, [status, publish])

  useEffect(() => {
    if (status === 'finishing' && points && !isLoadingPoints) {
      finishRouteAction()
    }
  }, [points, isLoadingPoints, status])

  const startRoute = async () => {
    try {
      const response = await createRouteMutation.mutateAsync()
      setRouteId(response.id)
      setStatus('active')
      setTimer(0)
    } catch (err) {
      console.error('Error al crear ruta:', err)
    }
  }

  const finishRoute = () => {
    setStatus('finishing')
  }

  const finishRouteAction = async () => {
    if (!routeId || !points) return

    const arrayPoints = points.map(p => [p.latitude, p.longitude]) as [number, number][]
    const pl = polyline.encode(arrayPoints)

    try {
      console.log({ routeId, pl })
      await finishRouteMutation.mutateAsync({
        route_id: routeId,
        polyline: pl,
      })
      setStatus('initial')
      setRouteId(null)
      setTimer(0)
      queryClient.invalidateQueries({ queryKey: ['driver', 'route'] })
      await dismissNotification()
    } catch (error) {
      console.error('Error al terminar ruta:', error)
      setStatus('active')
    }
  }

  return (
    <DriverTripContext.Provider value={{ status, routeId, timer, startRoute, finishRoute }}>
      {children}
    </DriverTripContext.Provider>
  )
}

export const useDriverTripContext = () => {
  const context = useContext(DriverTripContext)
  if (!context) throw new Error('useDriverTripContext must be used within a DriverTripProvider')
  return context
}
