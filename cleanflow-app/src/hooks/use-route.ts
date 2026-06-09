import { getScheduledRoutes } from '@/services/route'
import { useQuery } from '@tanstack/react-query'

export const useDriverRoute = () => {
  const { data } = useQuery({
    queryKey: ['driver', 'route'],
    queryFn: getScheduledRoutes,
    staleTime: 30_000,
    throwOnError: false,
  })

  return {
    data,
  }
}
