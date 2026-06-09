import { privateApi } from '@/api/api'
import { IDriverProfile } from '@/types/driver'

export const getDriverProfile = async () => {
  const response = await privateApi.get<IDriverProfile>('/driver')
  return response.data
}
