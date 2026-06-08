import { registerDeviceToken, unregisterDeviceToken } from '@/services/device-token'
import { IApiError } from '@/types/api-error'
import { useMutation } from '@tanstack/react-query'
import { AxiosError } from 'axios'

export const useDeviceToken = () => {
  const registerMutation = useMutation<void, AxiosError<IApiError>, string>({
    mutationFn: registerDeviceToken,
  })

  const unregisterMutation = useMutation<void, AxiosError<IApiError>, string>({
    mutationFn: unregisterDeviceToken,
  })

  return {
    registerMutation,
    unregisterMutation,
  }
}
