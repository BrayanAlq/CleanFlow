import { privateApi } from '@/api/api'
import { useStompContext } from '@/context/stomp-context'
import { watchPositionAsync } from '@/services/location'
import { createRoute as createRouteApi, finishRoute as finishRouteApi, getPointsByRoute } from '@/services/route'
import { routeStore } from '@/store/route-store'
import { startBackgroundTracking, stopBackgroundTracking } from '@/tasks/background-location'
import loggers from '@/utils/loggers'
import polyline from '@mapbox/polyline'
import { useQueryClient } from '@tanstack/react-query'
import { createContext, ReactNode, useCallback, useContext, useEffect, useRef, useState } from 'react'
import { AppState, AppStateStatus } from 'react-native'

const log = loggers.driverTrip

type Status = 'initial' | 'active' | 'finishing'
interface ILocation {
  latitude: number
  longitude: number
}

interface DriverTripContextValue {
  status: Status
  startRoute: () => Promise<void>
  finishRoute: () => Promise<void>
  timer: number
  routeId: number | null
  isLoading: boolean
  routeStartTimestamp: number | null
  currentPosition: ILocation | null
}

const DriverTripContext = createContext<DriverTripContextValue | null>(null)

export const DriverTripProvider = ({ children }: { children: ReactNode }) => {
  const [status, setStatus] = useState<Status>('initial')
  const [timer, setTimer] = useState(0)
  const [routeId, setRouteIdState] = useState<number | null>(null)
  const [isLoading, setIsLoading] = useState(false)
  const [currentPosition, setCurrentPosition] = useState<ILocation | null>(null)

  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const positionWatchRef = useRef<(() => void) | null>(null)
  const appStateRef = useRef<AppStateStatus>(AppState.currentState)
  const routeStartTsRef = useRef<number | null>(null)
  const lastSentRef = useRef<{ lat: number; lng: number; time: number } | null>(null)

  const { publish, connected } = useStompContext()
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

  // ========================================
  // Permanent location watcher
  // ========================================
  useEffect(() => {
    const startPermanentLocationWatch = async () => {
      try {
        log.debug('Initializing permanent location watch...')
        const unwatch = await watchPositionAsync(
          location => {
            const { latitude, longitude } = location.coords
            log.debug('Position updated:', { latitude, longitude })
            setCurrentPosition({ latitude, longitude })
          },
          err => {
            log.error('Permanent watch error:', err)
          },
        )
        positionWatchRef.current = unwatch
        log.info('Permanent location watch started')
      } catch (err) {
        log.error('Error starting permanent location watch:', err)
      }
    }

    startPermanentLocationWatch()

    return () => {
      if (positionWatchRef.current) {
        log.debug('Stopping permanent location watch...')
        positionWatchRef.current()
        positionWatchRef.current = null
      }
      if (timerRef.current) clearInterval(timerRef.current)
      stopBackgroundTracking()
    }
  }, [])

  // ========================================
  // Send location when position changes
  // ========================================
  useEffect(() => {
    if (!routeId || !currentPosition || status !== 'active') return

    sendLocation(routeId, currentPosition.latitude, currentPosition.longitude)
  }, [currentPosition, status, routeId])

  const sendLocation = useCallback(
    (route_id: number, latitude: number, longitude: number) => {
      const last = lastSentRef.current
      if (last && last.lat === latitude && last.lng === longitude && Date.now() - last.time < 5000) {
        log.debug('Same position, skipping send')
        return
      }
      lastSentRef.current = { lat: latitude, lng: longitude, time: Date.now() }

      const currentState = appStateRef.current
      const body = { route_id, latitude, longitude }

      if (currentState === 'active') {
        log.debug('Sending location via WS:', body)
        publish('/app/driver.location', body)
      } else {
        log.debug('Sending location via HTTP:', body)
        privateApi.post('/driver/route/point', body).catch(err => log.error('Error sending location via HTTP:', err))
      }
    },
    [publish, connected],
  )

  const startRoute = useCallback(async () => {
    if (status !== 'initial') return
    try {
      setIsLoading(true)
      log.debug('Starting route...')

      const response = await createRouteApi()
      const newRouteId = response.id
      log.info('Route created:', newRouteId)

      await routeStore.setRouteId(newRouteId)

      const now = Date.now()
      routeStartTsRef.current = now
      routeStore.setStartTimestamp(now)

      setRouteIdState(newRouteId)
      setStatus('active')
      setTimer(0)

      timerRef.current = setInterval(() => {
        if (routeStartTsRef.current) {
          setTimer(Math.floor((Date.now() - routeStartTsRef.current) / 1000))
        }
      }, 1000)

      queryClient.invalidateQueries({ queryKey: ['driver', 'home'] })
      startBackgroundTracking()

      log.debug('Route initialized, waiting for location updates...')
    } catch (error) {
      log.error('Error starting route:', error)
      setStatus('initial')
    } finally {
      setIsLoading(false)
    }
  }, [status, queryClient])

  const finishRoute = useCallback(async () => {
    if (status !== 'active' || !routeId) return
    try {
      setIsLoading(true)
      setStatus('finishing')
      log.debug('Finishing route...')

      await stopBackgroundTracking()

      if (timerRef.current) {
        clearInterval(timerRef.current)
        timerRef.current = null
      }

      const points = await getPointsByRoute(routeId)
      const coords: [number, number][] = points.map(p => [p.latitude, p.longitude])
      const polylineStr = coords.length > 0 ? polyline.encode(coords) : ''

      await finishRouteApi({ route_id: routeId, polyline: polylineStr })
      log.info('Route finished')

      await routeStore.setRouteId(null)
      routeStore.setStartTimestamp(null)
      routeStartTsRef.current = null

      setRouteIdState(null)
      setStatus('initial')
      setTimer(0)
      // currentPosition continues to update from permanent watch
    } catch (error) {
      log.error('Error finishing route:', error)
      setStatus('active')
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
        currentPosition,
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
