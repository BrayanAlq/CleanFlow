import { useRef, useState } from "react"
import { login } from "../service/authService"
import axios from "axios"
import { useAuth } from "../auth/AuthContext"
import { useNavigate } from "react-router-dom"
import { IconEye } from "../icons/IconEye"
import { IconEyeOff } from "../icons/IconEyeOff"

export const LoginScreen = () => {
  const [credentials, setCredentials] = useState<{ username: string, password: string }>({ username: '', password: '' })
  const [errors, setErrors] = useState<{ username?: string, password?: string }>({})
  const [serverError, setServerError] = useState<string | null>(null)
  const [showPassword, setShowPassword] = useState(false)
  const passwordRef = useRef<HTMLInputElement>(null)
  const { login: loginHook } = useAuth()
  const navigate = useNavigate()

  const handleLogin = async () => {
    const newErrors: typeof errors = {}
    if (!credentials.username.trim()) newErrors.username = 'El campo nombre de usuario es obligatorio'
    if (!credentials.password.trim()) newErrors.password = 'El campo contraseña es obligatorio'

    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors)
      return
    }

    setErrors({})
    setServerError(null)

    try {
      const data = await login(credentials.username, credentials.password)
      loginHook(data.token)
      navigate('/map')
    } catch (e: any) {
      if (axios.isAxiosError(e) && e.response?.status === 401) {
        setServerError('Usuario o contraseña incorrectos')
      } else {
        setServerError('Error de conexión')
      }
    }
  }

  return (
    <div className="h-dvh w-dvw flex flex-col items-center justify-center bg-sky-900">
      <div className="flex flex-col w-[80dvw] h-[80dvh] rounded-2xl shadow py-10 px-40 gap-20">
        <div className="text-9xl text-white font-display">cleanflow</div>
        <div
          className="flex"
        >
          <div className="w-1/2 text-4xl text-white font-normal">
            Inicia sesión
          </div>
          <div className="w-1/2 min-w-100 h-auto bg-sky-200 rounded-3xl flex flex-col gap-5 p-10 shadow-xl font-normal">
            <div className="flex flex-col h-auto w-full gap-2">
              <label className="text-xl">Usuario</label>
              <input
                type="text"
                className={`${errors.username ? 'border-red-500' : ''} h-10 rounded-lg border-black border-[0.1px] px-3 py-0 text-xl outline-none text-black`}
                placeholder="Escribe aquí tu usuario"
                onChange={(e) => {
                  setCredentials(prev => ({ ...prev, username: e.target.value }))
                  if (errors.username) setErrors(prev => ({ ...prev, username: undefined }))
                }}
                value={credentials.username}
                onKeyDown={(e) => e.key === "Enter" && passwordRef.current?.focus()}
              />
            </div>
            <div className="flex flex-col h-auto w-full gap-2">
              <label className="text-xl">Contraseña</label>
              <div className="relative">
                <input
                  ref={passwordRef}
                  type={showPassword ? 'text' : 'password'}
                  className={`${errors.password ? 'border-red-500' : ''} h-10 w-full rounded-lg border-black border-[0.1px] px-3 py-0 text-xl outline-none text-black`}
                  placeholder="Escribe aquí tu contraseña"
                  onChange={(e) => {
                    setCredentials(prev => ({ ...prev, password: e.target.value }))
                    if (errors.password) setErrors(prev => ({ ...prev, password: undefined }))
                  }}
                  value={credentials.password}
                  onKeyDown={(e) => e.key === "Enter" && handleLogin()}
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(prev => !prev)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-black"
                >
                  {showPassword ? <IconEyeOff className="w-6 h-6" /> : <IconEye className="w-6 h-6" />}
                </button>
              </div>
            </div>
            <div className="w-full relative h-15">
              {serverError && (
                <p className="absolute text-red-500 w-full text-center text-sm z-1000">Hola soy un mensaje de error</p>
              )}
              <button
                onClick={handleLogin}
                className="absolute bottom-0 w-full h-10 rounded-lg bg-amber-100 px-5 py-2 text-xl"
              >
                Iniciar sesión
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}