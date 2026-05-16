import { login, type LoginRequest, type LoginResponse } from "@/service/authService"
import { useAuth } from "@/auth/AuthContext"
import { useNavigate } from "react-router-dom"
import { IconEye } from "@/icons/IconEye"
import { IconEyeOff } from "@/icons/IconEyeOff"
import { Wave } from "@/components/Login/Wave"
import type { ErrorApiType } from "@/models/error.model"
import { Input } from "@/components/Input"
import { AxiosError } from "axios"
import { useMutation } from "@tanstack/react-query"
import { useState } from "react"

export const LoginScreen = () => {
  const [credentials, setCredentials] = useState<{ username: string, password: string }>({ username: '', password: '' })
  const [errors, setErrors] = useState<{ username?: string, password?: string }>({})
  const [loginError, setLoginError] = useState<string | null>()
  const [showPassword, setShowPassword] = useState(false)
  const { login: loginHook } = useAuth()
  const navigate = useNavigate()
  
  const loginMutation = useMutation<
    LoginResponse,
    AxiosError<ErrorApiType>,
    LoginRequest
  >({
    mutationFn: login,
    onSuccess: (data) => {
      loginHook(data.token)
      navigate('/map')
    },
    onError: (e) => {
      setLoginError(e.response?.data.message)
    }
  })

  const handleLogin = async (e: React.SubmitEvent<HTMLFormElement>) => {
    e.preventDefault()
    const newErrors: typeof errors = {}
    if (!credentials.username.trim()) newErrors.username = 'El campo nombre de usuario es obligatorio'
    if (!credentials.password.trim()) newErrors.password = 'El campo contraseña es obligatorio'

    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors)
      return
    }

    setErrors({})
    setLoginError(null)

    loginMutation.mutate(credentials)
  }

  return (
    <div className="relative h-dvh w-dvw flex flex-col items-center justify-center bg-sky-900">
      <Wave className="absolute bottom-0 text-sky-200 w-full stroke-transparent shadow-xl" />
      <div className="flex flex-col w-[80dvw] h-[80dvh] rounded-2xl py-20 px-40 gap-5 transition-all duration-300 ease-in-out">
        <div className="text-8xl text-white font-main-title">Cleanflow</div>
        <div
          className="flex gap-20"
        >
          <div className="w-1/2 text-3xl text-white font-normal">
            Inicia sesión
          </div>
          <form
            onSubmit={handleLogin}
            className="w-1/2 min-w-100 h-auto bg-sky-200 rounded-3xl flex flex-col gap-5 p-10 shadow-xl font-normal"
          >
            <Input
              name="Usuario"
              type="text"
              placeholder="Escribe aquí tu usuario"
              onChange={(e) => {
                setCredentials(prev => ({ ...prev, username: e.target.value }))
                if (errors.username) setErrors(prev => ({ ...prev, username: undefined }))
              }}
              value={credentials.username}
              errors={errors.username}
            />
            <Input
              className="relative"
              name="Contraseña"
              type={showPassword ? 'text' : 'password'}
              placeholder="Escribe aquí tu contraseña"
              onChange={(e) => {
                setCredentials(prev => ({ ...prev, password: e.target.value }))
                if (errors.password) setErrors(prev => ({ ...prev, password: undefined }))
              }}
              value={credentials.password}
              errors={errors.password}
            >
              <button
                type="button"
                onClick={() => setShowPassword(prev => !prev)}
                className="absolute right-3 top-1/2 text-black cursor-pointer"
              >
                {showPassword ? <IconEyeOff className="w-6 h-6" /> : <IconEye className="w-6 h-6" />}
              </button>
            </Input>
            <div className="w-full flex flex-col gap-5">
              <div
                className={`
                  overflow-hidden transition-all duration-300 ease-in-out
                  ${loginError
                    ? 'max-h-20 opacity-100 scale-100 mb-0'
                    : 'max-h-0 opacity-0 scale-95'
                  }
                `}
              >
                <p className="text-black h-10 flex items-center justify-center w-full text-xs bg-red-200 border-red border-[0.1px] rounded-lg">
                  {loginError}
                </p>
              </div>
              <button
                type="submit"
                className="w-full h-10 rounded-lg bg-sky-900 text-white px-5 py-2 text-xs border-border-accent border-[0.1px] cursor-pointer"
              >
                Iniciar sesión
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}