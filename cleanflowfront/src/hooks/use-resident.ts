import type { BoundType } from '@/models/bound.model'
import { getResidentsInViewport } from '@/service/adminService'
import { useQuery } from '@tanstack/react-query'

export const useResidentInViewport = (bounds: BoundType | null) => {
  const { data } = useQuery({
    queryKey: ['admin', 'resident', bounds],
    queryFn: () => getResidentsInViewport(bounds!),
    staleTime: 30_000,
    enabled: bounds !== null,
  })

  return { data }
}
