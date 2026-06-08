import { getDriverProfile } from '@/services/driver'
import { useQuery } from '@tanstack/react-query'

export const useDriver = () => {
  const { data } = useQuery({
    queryKey: ['driver', 'profile'],
    queryFn: getDriverProfile,
    staleTime: 30_000,
  })

  return {
    data,
  }
}
