import { login, registerResident } from '@/services/auth'
import { IApiError } from '@/types/api-error'
import { ILoginRequest, ILoginResponse, IResidentRequest } from '@/types/auth'
import { useMutation } from '@tanstack/react-query'
import { AxiosError } from 'axios'

export const useAuth = () => {
  const loginMutation = useMutation<ILoginResponse, AxiosError<IApiError>, ILoginRequest>({
    mutationFn: login,
  })

  const registerResidentMutation = useMutation<void, AxiosError<IApiError>, IResidentRequest>({
    mutationFn: registerResident,
  })

  return {
    loginMutation,
    registerResidentMutation,
  }
}
