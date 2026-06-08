import { getReportsByContainerId } from '@/services/report'
import { useInfiniteQuery } from '@tanstack/react-query'
import { toast } from 'sonner-native'

interface IUseReportsHookProps {
  containerId: number
  size: number
}

export const useGetReports = ({ containerId, size }: IUseReportsHookProps) => {
  const { data, fetchNextPage, hasNextPage, isFetchingNextPage } = useInfiniteQuery({
    queryKey: ['reports', 'container', containerId],
    queryFn: ({ pageParam }: { pageParam: string | null }) =>
      getReportsByContainerId({ containerId, size: size, cursor: pageParam }),
    initialPageParam: null,
    getNextPageParam: lastPage => (lastPage.has_next ? lastPage.cursor : null),
    enabled: !!containerId,
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onerror: (error: Error) => {
        toast.error('Ocurrió un error al cargar reportes')
        console.log(error)
      },
    },
  })

  return {
    data,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  }
}
