import axiosInstance from "@/api/axiosInstance"
import type { GeneratedRouteType } from "@/models/generated.route.model"
import type { CursorPageResponse } from "@/models/page.model"

interface GetGeneratedRoutesParams {
  size?: number
  cursor?: number | null
  driverId?: number
  date?: string
}

export const getGeneratedRoutes = async (
  params?: GetGeneratedRoutesParams
) => {
  const response = await axiosInstance.get<CursorPageResponse<GeneratedRouteType>>(
    '/generated-route',
    { params }
  )
  return response.data
}