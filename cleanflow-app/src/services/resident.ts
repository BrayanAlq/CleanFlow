import { privateApi } from '@/api/api'
import { IRemaining, IResidentProfile } from '@/types/resident'

export const getResidentProfile = async () => {
  const response = await privateApi.get<IResidentProfile>('/resident')
  return response.data
}

export const getRemaining = async () => {
  const response = await privateApi.get<IRemaining>('/resident/remaining/goal')
  return response.data
}
