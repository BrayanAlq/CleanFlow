import axiosInstance from "@/api/axiosInstance"
import type { DriverInfoType } from "@/models/driver.model"

export const getDrivers = async () => {
  const response = await axiosInstance.get<DriverInfoType[]>('/admin/driver')
  return response.data
}
