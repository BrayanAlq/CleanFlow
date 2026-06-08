import { publicApi } from '@/api/api'
import { ILoginRequest, ILoginResponse, IResidentRequest } from '@/types/auth'

export const login = async ({ username, password }: ILoginRequest) => {
  const response = await publicApi.post<ILoginResponse>('/auth/login', {
    username,
    password,
  })
  return response.data
}

export const registerResident = async (data: IResidentRequest) => {
  const response = await publicApi.post<void>('/auth/resident', data)
  return response.data
}
