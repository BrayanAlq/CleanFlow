import { useCurrentPosition } from '@/hooks/use-current-position'
import { getDriverHome } from '@/services/route'
import { useQuery } from '@tanstack/react-query'
import * as SecureStore from 'expo-secure-store'
import { useCallback, useEffect, useRef, useState } from 'react'

const PROXIMITY_KM = 0.03

function haversineKm(lat1: number, lng1: number, lat2: number, lng2: number): number {
  const R = 6371
  const dLat = ((lat2 - lat1) * Math.PI) / 180
  const dLng = ((lng2 - lng1) * Math.PI) / 180
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos((lat1 * Math.PI) / 180) * Math.cos((lat2 * Math.PI) / 180) * Math.sin(dLng / 2) ** 2
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
}

export function useRouteProgress() {
  const { location, hasRealLocation } = useCurrentPosition()
  const [cursor, setCursor] = useState(0)
  const [routeId, setRouteId] = useState<number | null>(null)
  const advancedRef = useRef<Set<number>>(new Set())
  const loadedFromStore = useRef(false)

  const { data } = useQuery({
    queryKey: ['driver', 'home', cursor],
    queryFn: () => getDriverHome(cursor),
    staleTime: 30_000,
    throwOnError: false,
  })

  useEffect(() => {
    const id = data?.id
    if (id == null) {
      setRouteId(null)
      return
    }
    setRouteId(id)
    if (!loadedFromStore.current) {
      loadedFromStore.current = true
      SecureStore.getItemAsync(`route_cursor_${id}`).then(raw => {
        const parsed = raw != null ? parseInt(raw, 10) : NaN
        if (!isNaN(parsed)) {
          setCursor(parsed)
        }
      })
    }
  }, [data?.id])

  useEffect(() => {
    if (routeId == null) return
    SecureStore.setItemAsync(`route_cursor_${routeId}`, String(cursor))
  }, [cursor, routeId])

  const currentTarget = data?.current_target ?? undefined
  const totalCount = data?.total_count ?? 0
  const isRouteFinished = totalCount > 0 && cursor >= totalCount

  useEffect(() => {
    if (!currentTarget || !hasRealLocation) return
    if (advancedRef.current.has(currentTarget.container_id)) return

    const dist = haversineKm(
      location.latitude,
      location.longitude,
      currentTarget.latitude,
      currentTarget.longitude,
    )

    if (dist < PROXIMITY_KM) {
      advancedRef.current.add(currentTarget.container_id)
      setCursor(prev => prev + 1)
    }
  }, [location, currentTarget, hasRealLocation])

  const resetProgress = useCallback(async () => {
    setCursor(0)
    advancedRef.current = new Set()
    loadedFromStore.current = false
    if (routeId != null) {
      await SecureStore.deleteItemAsync(`route_cursor_${routeId}`)
    }
  }, [routeId])

  return {
    data,
    currentTarget,
    cursor,
    totalCount,
    resetProgress,
    isRouteFinished,
  }
}
