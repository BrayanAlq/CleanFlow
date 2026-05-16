import { useStoreContainer } from "@/store/useStoreContainer"
import { ReportItem } from "@/components/MapManager/ReportItem"
import { getReportsByContainerId } from "@/service/reportService"
import type { ReportType } from "@/models/report.model"
import { useInfiniteQuery } from "@tanstack/react-query"
import { toast } from "sonner"
import { useCallback, useEffect, useRef } from "react"

export const ReportSection = ({ liveReports }: { liveReports: ReportType[]} ) => {
  const selectedId = useStoreContainer((s) => s.selectedId)
  const bottomRef = useRef<HTMLDivElement>(null)

  const {
    data,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useInfiniteQuery({
    queryKey: ['reports', 'container', selectedId],
    queryFn: ({ pageParam  }: { pageParam: number | null}) => getReportsByContainerId(selectedId!, pageParam),
    initialPageParam: null,
    getNextPageParam: (lastPage) => lastPage.has_next ? lastPage.cursor : undefined,
    enabled: selectedId !== null,
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onError: (error: Error) => {
        toast.error('Error al cargar reportes', {
          description: error.message,
        })
      }
    }
  })

  const handleObserver = useCallback((entries: IntersectionObserverEntry[]) => {
    const [entry] = entries
    if (entry.isIntersecting && hasNextPage && !isFetchingNextPage) {
      fetchNextPage()
    }
  }, [hasNextPage, isFetchingNextPage, fetchNextPage])

  useEffect(() => {
    const el = bottomRef.current
    if (!el) return
    const observer = new IntersectionObserver(handleObserver, { threshold: 1.0 })
    observer.observe(el)
    return () => observer.disconnect()
  }, [handleObserver])

  const paginatedReports = data?.pages.flatMap(page => page.content) ?? []
  const allReports = [
    ...liveReports,
    ...paginatedReports.filter(r => !liveReports.some(lr => lr.id === r.id))
  ]

  return (
    <div className="overflow-y-scroll px-5 text-white flex flex-col max-h-64">
      <h1 className="text-lg font-bold pb-2">Reportes</h1>
      {
        allReports?.map(
          ({ id, content, images, timestamp, user }) => 
          <ReportItem key={id} id={id} content={content} images={images} timestamp={timestamp} user={user} />
        )
      }
      <div ref={bottomRef} className="py-1">
        {isFetchingNextPage && (
          <p className="text-center text-sm text-gray-400">Cargando más...</p>
        )}
      </div>
    </div>
  )
}