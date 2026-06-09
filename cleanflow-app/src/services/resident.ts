import { privateApi } from '@/api/api'
import { IResidentProfile } from '@/types/resident'

export const getResidentProfile = async () => {
  const response = await privateApi.get<IResidentProfile>('/resident')
  return response.data
}
