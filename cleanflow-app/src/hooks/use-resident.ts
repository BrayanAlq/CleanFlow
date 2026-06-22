import { getRemaining, getResidentProfile } from '@/services/resident'
import { useQuery } from '@tanstack/react-query'

export const useResident = () => {
  const { data } = useQuery({
    queryKey: ['resident', 'profile'],
    queryFn: getResidentProfile,
    staleTime: 30_000,
  })

  return { data }
}

export const useRemaining = () => {
  const { data } = useQuery({
    queryKey: ['resident', 'remaining'],
    queryFn: getRemaining,
    staleTime: 30_000,
  })

  return { data }
}
