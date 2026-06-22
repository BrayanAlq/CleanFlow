import { getContainerInViewport, getNearContainerFromResident } from '@/services/container'
import { IBound } from '@/types/bound'
import { useInfiniteQuery, useQuery } from '@tanstack/react-query'
import { toast } from 'sonner-native'

export const useContainerInViewport = (bounds: IBound | null) => {
  const { data } = useQuery({
    queryKey: ['container', 'viewport', bounds],
    queryFn: () => getContainerInViewport(bounds!),
    enabled: !!bounds,
    staleTime: 30_000,
    throwOnError: false,
    placeholderData: prevData => prevData,
    meta: {
      onerror: (error: Error) => {
        toast.error(error.message)
      },
    },
  })

  return { data }
}

export const useNearContainers = () => {
  const { data, isFetchingNextPage, fetchNextPage, hasNextPage } = useInfiniteQuery({
    queryKey: ['container', 'near'],
    queryFn: ({ pageParam }: { pageParam: string | null }) => getNearContainerFromResident({ cursor: pageParam }),
    getNextPageParam: lastPage => (lastPage.has_next ? lastPage.cursor : null),
    initialPageParam: null,
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onerror: (error: Error) => {
        toast.error('Ocurrió un error al cargar los contenedores cercanos')
      },
    },
  })

  return { data, isFetchingNextPage, fetchNextPage, hasNextPage }
}
