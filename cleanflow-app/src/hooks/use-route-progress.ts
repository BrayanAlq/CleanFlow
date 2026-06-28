import { getDriverHome } from '@/services/route'
import { useQuery } from '@tanstack/react-query'

interface IGetDriverHomeParams {
  latitude: number | null
  longitude: number | null
}
export function useRouteProgress({ latitude, longitude }: IGetDriverHomeParams) {
  const { data, isLoading } = useQuery({
    queryKey: ['driver', 'home', latitude, longitude],
    queryFn: () => getDriverHome({ latitude: latitude!, longitude: longitude! }),
    enabled: latitude != null && longitude != null,
    staleTime: 30_000,
  })

  return { data, isLoading }
}
