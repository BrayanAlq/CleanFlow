import { createRoute, finishRoute, getPointsByRoute, getScheduledRoutes } from '@/services/route'
import { IApiError } from '@/types/api-error'
import { ICreateRouteResponse, IFinishRouteRequest } from '@/types/route'
import { useMutation, useQuery } from '@tanstack/react-query'

export const useDriverRoute = () => {
  const { data } = useQuery({
    queryKey: ['driver', 'route'],
    queryFn: getScheduledRoutes,
    staleTime: 30_000,
    throwOnError: false,
  })

  return { data }
}

export const useCreateRoute = () => {
  const createRouteMutation = useMutation<ICreateRouteResponse, IApiError, void>({
    mutationKey: ['driver', 'route'],
    mutationFn: createRoute,
  })

  return { createRouteMutation }
}

export const useGetPointsByRoute = (route_id: number | null) => {
  const { data, isLoading } = useQuery({
    queryKey: ['driver', 'points', route_id],
    queryFn: () => getPointsByRoute(route_id!),
    staleTime: 30_000,
    enabled: !!route_id,
  })

  return { data, isLoading }
}

export const useFinishRoute = () => {
  const finishRouteMutation = useMutation<void, IApiError, IFinishRouteRequest>({
    mutationKey: ['driver', 'finish-route'],
    mutationFn: finishRoute,
  })

  return { finishRouteMutation }
}
