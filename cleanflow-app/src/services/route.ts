import { privateApi } from '@/api/api'
import {
  ICreateRouteResponse,
  IDriverHomeResponse,
  IFinishRouteRequest,
  IPointResponse,
  IScheduledRoute,
} from '@/types/route'

export const getScheduledRoutes = async () => {
  const response = await privateApi.get<IScheduledRoute>('/driver/scheduled-route')
  return response.data
}

interface IGetDriverHomeParams {
  latitude: number
  longitude: number
}
export const getDriverHome = async (params: IGetDriverHomeParams) => {
  const response = await privateApi.get<IDriverHomeResponse>('/driver/home', { params })
  return response.data
}

export const createRoute = async () => {
  const response = await privateApi.post<ICreateRouteResponse>('/route')
  return response.data
}

export const getPointsByRoute = async (route_id: number) => {
  const response = await privateApi.get<IPointResponse[]>(`/route/points/${route_id}`)
  return response.data
}

export const finishRoute = async ({ route_id, polyline }: IFinishRouteRequest) => {
  await privateApi.patch<void>(`/route/${route_id}`, { polyline })
}
