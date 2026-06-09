import { privateApi } from '@/api/api'
import { IScheduledRoute } from '@/types/route'

export const getScheduledRoutes = async () => {
  const response = await privateApi.get<IScheduledRoute>('/driver/scheduled-route')
  return response.data
}
