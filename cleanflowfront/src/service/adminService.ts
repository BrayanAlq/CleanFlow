import axiosInstance from "@/api/axiosInstance"
import type { DriverInfoType } from "@/models/driver.model"

export const getDrivers = async () => {
  const response = await axiosInstance.get<DriverInfoType[]>('/admin/drivers')
  return response.data
}

export const updateUserStatus = async (userId: number, enabled: boolean) => {
  await axiosInstance.patch('/admin/user/status', { user_id: userId, enabled })
}
