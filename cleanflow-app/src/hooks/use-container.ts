import { getContainerInViewport } from '@/services/container'
import { IBound } from '@/types/bound'
import { useQuery } from '@tanstack/react-query'
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

  return {
    data,
  }
}
