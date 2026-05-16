import { useInfiniteQuery } from "@tanstack/react-query"
import { CardRoute } from "./CardRoute"
import { getRoutes } from "@/service/routeService"
import { useCallback, useEffect, useMemo, useRef } from "react"
import { useStoreRoute } from "@/store/useStoreRoute"

interface RoutesContainerProps {
  driverId?: number
  date?: string
}

export const RoutesContainer = ({ driverId, date }: RoutesContainerProps) => {
  const bottomRef = useRef<HTMLDivElement>(null)
  const rootRef = useRef<HTMLDivElement>(null)
  const setRoutes = useStoreRoute((r) => r.setRoutes)

  const {
    data: routes,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useInfiniteQuery({
    queryKey: ['route', driverId, date],
    queryFn: ({ pageParam }: { pageParam: number | null }) => getRoutes({
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

  const paginatedRoutes = useMemo(() => {
    return routes?.pages.flatMap(page => page.content) ?? []
  }, [routes])

  useEffect(() => {
    setRoutes(paginatedRoutes)
  }, [paginatedRoutes, setRoutes])

  return (
    <div
      ref={rootRef}
      className="flex flex-col flex-1 gap-2 rounded-lg overflow-y-scroll"
    >
      {
        paginatedRoutes?.map(({ id, driver, start_at, end_at, polyline }) => (
          <CardRoute
            key={id}
            id={id}
            startTime={start_at}
            endTime={end_at}
            name={driver.first_name + ' ' + driver.last_name}
            polyline={polyline}
          />
        ))
      }
      <div ref={bottomRef} className="py-1">
        {isFetchingNextPage && (
          <p className="text-center text-sm text-gray-400">Cargando más...</p>
        )}
      </div>
    </div>
  )
}