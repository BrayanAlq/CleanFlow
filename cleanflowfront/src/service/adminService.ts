import axiosInstance from '@/api/axiosInstance'
import type { DriverInfoType, CreateDriverPayload } from '@/models/driver.model'
import type { ResidentInfoType } from '@/models/resident.model'
import type { PageableResponse } from '@/models/pageable.model'
import type { BoundType } from '@/models/bound.model'

export const getDrivers = async () => {
  const response = await axiosInstance.get<DriverInfoType[]>('/admin/drivers')
  return response.data
}

export const getResidents = async (page: number, size: number) => {
  const response = await axiosInstance.get<PageableResponse<ResidentInfoType>>('/admin/resident', {
    params: { page, size },
  })
  return response.data.content
}

export const createDriver = async (data: CreateDriverPayload) => {
  await axiosInstance.post('/auth/driver', data)
}

export const updateUserStatus = async (userId: number, enabled: boolean) => {
  await axiosInstance.patch('/admin/user/status', { user_id: userId, enabled })
}

export const getResidentsInViewport = async (bounds: BoundType) => {
  const response = await axiosInstance.get<ResidentInfoType[]>('/admin/resident/viewport', {
    params: { ...bounds },
  })
  return response.data
}
