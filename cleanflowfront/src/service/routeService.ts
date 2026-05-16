import axiosInstance from "@/api/axiosInstance"
import type { CursorPageResponse } from "@/models/page.model"
import type { RouteType } from "@/models/route.mode"

interface GetRoutesParams {
  size?: number
  cursor?: number | null
  driverId?: number
  date?: string
}

export const getRoutes = async (params?: GetRoutesParams) => {
  const response = await axiosInstance.get<CursorPageResponse<RouteType>>(
    '/route',
    { params }
  )
  return response.data
}