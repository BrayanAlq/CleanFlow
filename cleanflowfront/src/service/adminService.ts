import axiosInstance from "@/api/axiosInstance"
import type { DriverInfoType } from "@/models/driver.model"
import type { ResidentInfoType } from "@/models/resident.model"
import type { PageableResponse } from "@/models/pageable.model"

export const getDrivers = async () => {
  const response = await axiosInstance.get<DriverInfoType[]>('/admin/drivers')
  return response.data
}

export const getResidents = async (page: number, size: number) => {
  const response = await axiosInstance.get<PageableResponse<ResidentInfoType>>('/admin/resident', {
    params: { page, size }
  })
  return response.data.content
}

export const updateUserStatus = async (userId: number, enabled: boolean) => {
  await axiosInstance.patch('/admin/user/status', { user_id: userId, enabled })
}
