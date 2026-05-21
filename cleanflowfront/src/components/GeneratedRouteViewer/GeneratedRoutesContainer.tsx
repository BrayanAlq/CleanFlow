import { useInfiniteQuery } from "@tanstack/react-query"
import { getGeneratedRoutes } from "@/service/generatedRouteService"
import { useStoreGeneratedRoutes } from "@/store/useStoreGeneratedRoutes"
import { useCallback, useEffect, useMemo, useRef } from "react"
import { CardGeneratedRoute } from "./CardGeneratedRoute"
import polyline from "@mapbox/polyline"

interface RoutesContainerProps {
  driverId?: number
  date?: string
}

export const GeneratedRoutesContainer = ({ driverId, date }: RoutesContainerProps) => {
  const bottomRef = useRef<HTMLDivElement>(null)
  const rootRef = useRef<HTMLDivElement>(null)
  const setGeneratedRoutes = useStoreGeneratedRoutes((r) => r.setGeneratedRoutes)

  const {
    data: routes,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useInfiniteQuery({
    queryKey: ['generated-route', driverId, date],
    queryFn: ({ pageParam }: { pageParam: number | null }) => getGeneratedRoutes({
      cursor: pageParam,
      driverId,
      date,
      size: 6
    }),
    initialPageParam: null,
    getNextPageParam: (lastPage) => { return lastPage.has_next ? lastPage.cursor : null },
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onError: (error: Error) => {
        console.log(error)
      }
    }
  })

  const handleObserver = useCallback((entries: IntersectionObserverEntry[]) => {
    const [entry] = entries
    if (entry.isIntersecting && hasNextPage && !isFetchingNextPage) {
      console.log('fetching next page')
      fetchNextPage()
    }
  }, [hasNextPage, isFetchingNextPage, fetchNextPage])

  useEffect(() => {
    const el = bottomRef.current
    const root = rootRef.current
    if (!el || !root) return
    const observer = new IntersectionObserver(
      handleObserver, {
        root,
        threshold: 0.1
      }
    )
    observer.observe(el)
    return () => observer.disconnect()
  }, [handleObserver])

  const paginatedGeneratedRoutes = useMemo(() => {
    return routes?.pages.flatMap(page => page.content) ?? []
  }, [routes])

  useEffect(() => {
    setGeneratedRoutes(paginatedGeneratedRoutes)
  }, [paginatedGeneratedRoutes, setGeneratedRoutes])

  return (
    <div
      ref={rootRef}
      className="flex flex-col flex-1 gap-2 rounded-lg overflow-y-scroll"
    >
      {
        paginatedGeneratedRoutes?.map(({ id, driver, created_at, polylines }) => {
          const polylineEnconded = polyline.encode(polylines.flatMap(p => polyline.decode(p.polyline) as [number, number][]))
          return (
            <CardGeneratedRoute
              key={id}
              id={id}
              created_at={created_at}
              name={driver.first_name + ' ' + driver.last_name}
              polyline={polylineEnconded}
            />
          )
        })
      }
      <div ref={bottomRef} className="py-1">
        {isFetchingNextPage && (
          <p className="text-center text-sm text-gray-400">Cargando más...</p>
        )}
      </div>
    </div>
  )
}