import { privateApi } from '@/api/api'
import { useStompContext } from '@/context/stomp-context'
import { getPointsByRoute } from '@/services/route'
import { createRoute as createRouteApi, finishRoute as finishRouteApi } from '@/services/route'
import { watchPositionAsync } from '@/services/location'
import { routeStore } from '@/store/route-store'
import { startBackgroundTracking, stopBackgroundTracking } from '@/tasks/background-location'
import polyline from '@mapbox/polyline'
import { useQueryClient } from '@tanstack/react-query'
import { createContext, ReactNode, useCallback, useContext, useEffect, useRef, useState } from 'react'
import { AppState, AppStateStatus } from 'react-native'

type Status = 'initial' | 'active' | 'finishing'

interface DriverTripContextValue {
  status: Status
  startRoute: () => Promise<void>
  finishRoute: () => Promise<void>
  timer: number
  routeId: number | null
  isLoading: boolean
  routeStartTimestamp: number | null
}

const DriverTripContext = createContext<DriverTripContextValue | null>(null)

export const DriverTripProvider = ({ children }: { children: ReactNode }) => {
  const [status, setStatus] = useState<Status>('initial')
  const [timer, setTimer] = useState(0)
  const [routeId, setRouteIdState] = useState<number | null>(null)
  const [isLoading, setIsLoading] = useState(false)

  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const unwatchRef = useRef<(() => void) | null>(null)
  const appStateRef = useRef<AppStateStatus>(AppState.currentState)
  const routeStartTsRef = useRef<number | null>(null)
  const lastSentRef = useRef<{ lat: number; lng: number; time: number } | null>(null)
  const isActiveRef = useRef(false)

  const { publish } = useStompContext()
  const queryClient = useQueryClient()

  useEffect(() => {
    stopBackgroundTracking().catch(() => {})
  }, [])

  useEffect(() => {
    const handleAppState = (nextState: AppStateStatus) => {
      appStateRef.current = nextState
    }
    const subscription = AppState.addEventListener('change', handleAppState)
    return () => subscription.remove()
  }, [])

  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current)
      if (unwatchRef.current) unwatchRef.current()
      stopBackgroundTracking()
    }
  }, [])

  const sendLocation = useCallback(
    (route_id: number, latitude: number, longitude: number) => {
      const last = lastSentRef.current
      if (last && last.lat === latitude && last.lng === longitude && Date.now() - last.time < 5000) {
        return
      }
      lastSentRef.current = { lat: latitude, lng: longitude, time: Date.now() }

      const currentState = appStateRef.current
      const body = { route_id, latitude, longitude }

      if (currentState === 'active') {
        console.log('[DRIVER_TRIP] Enviando ubicación por WS:', body)
        publish('/app/driver.location', body)
      } else {
        console.log('[DRIVER_TRIP] Enviando ubicación por HTTP:', body)
        privateApi.post('/driver/route/point', body).catch(err =>
          console.error('[DRIVER_TRIP] Error sending location via HTTP:', err),
        )
      }
    },
    [publish],
  )

  const startLocationWatch = useCallback(
    async (route_id: number) => {
      try {
        const unwatch = await watchPositionAsync(
          (location) => {
            sendLocation(route_id, location.coords.latitude, location.coords.longitude)
          },
          (error) => {
            console.error('[DRIVER_TRIP] Location watch error:', error)
          },
        )
        unwatchRef.current = unwatch
        console.log('[DRIVER_TRIP] Location watch started')
      } catch (error) {
        console.error('[DRIVER_TRIP] Error starting location watch:', error)
      }
    },
    [sendLocation],
  )

  const startRoute = useCallback(async () => {
    if (status !== 'initial') return
    try {
      setIsLoading(true)

      const response = await createRouteApi()
      const newRouteId = response.id

      await routeStore.setRouteId(newRouteId)

      const now = Date.now()
      routeStartTsRef.current = now
      routeStore.setStartTimestamp(now)
      isActiveRef.current = true

      setRouteIdState(newRouteId)
      setStatus('active')
      setTimer(0)

      timerRef.current = setInterval(() => {
        if (routeStartTsRef.current) {
          setTimer(Math.floor((Date.now() - routeStartTsRef.current) / 1000))
        }
      }, 1000)

      queryClient.invalidateQueries({ queryKey: ['driver', 'home'] })

      startLocationWatch(newRouteId)
      startBackgroundTracking()
    } catch (error) {
      console.error('[DRIVER_TRIP] Error starting route:', error)
      setStatus('initial')
    } finally {
      setIsLoading(false)
    }
  }, [status, queryClient, startLocationWatch])

  const finishRoute = useCallback(async () => {
    if (status !== 'active' || !routeId) return
    try {
      setIsLoading(true)
      setStatus('finishing')
      isActiveRef.current = false

      if (unwatchRef.current) {
        unwatchRef.current()
        unwatchRef.current = null
      }

      await stopBackgroundTracking()

      if (timerRef.current) {
        clearInterval(timerRef.current)
        timerRef.current = null
      }

      const points = await getPointsByRoute(routeId)
      const coords: [number, number][] = points.map(p => [p.latitude, p.longitude])
      const polylineStr = coords.length > 0 ? polyline.encode(coords) : ''

      await finishRouteApi({ route_id: routeId, polyline: polylineStr })

      await routeStore.setRouteId(null)
      routeStore.setStartTimestamp(null)
      routeStartTsRef.current = null

      setRouteIdState(null)
      setStatus('initial')
      setTimer(0)
    } catch (error) {
      console.error('[DRIVER_TRIP] Error finishing route:', error)
      setStatus('active')
      isActiveRef.current = true
    } finally {
      setIsLoading(false)
    }
  }, [status, routeId])

  return (
    <DriverTripContext.Provider
      value={{
        status,
        startRoute,
        finishRoute,
        timer,
        routeId,
        isLoading,
        routeStartTimestamp: routeStartTsRef.current,
      }}
    >
      {children}
    </DriverTripContext.Provider>
  )
}

export const useDriverTripContext = () => {
  const context = useContext(DriverTripContext)
  if (!context) throw new Error('useDriverTripContext must be used within a DriverTripProvider')
  return context
}
