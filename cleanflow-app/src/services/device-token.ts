import { privateApi } from '@/api/api'

export const registerDeviceToken = async (token: string) => {
  const response = await privateApi.post<void>('/notification-token/register-token', { token })
  return response.data
}

export const unregisterDeviceToken = async (token: string) => {
  const response = await privateApi.post<void>('/notification-token/unregister-token', { token })
  return response.data
}
