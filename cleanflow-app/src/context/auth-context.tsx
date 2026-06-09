import { IJwtTokenInfo } from '@/types/auth'
import * as SecureStore from 'expo-secure-store'
import { jwtDecode } from 'jwt-decode'
import {
  createContext,
  ReactNode,
  useContext,
  useEffect,
  useState,
} from 'react'

interface AuthContextType {
  token: string | null
  login: (newToken: string) => Promise<void>
  logout: () => Promise<void>
  isLoggedIn: boolean
  user: IJwtTokenInfo | null
}

const AuthContext = createContext<AuthContextType | null>(null)

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [token, setToken] = useState<string | null>(null)
  const [user, setUser] = useState<IJwtTokenInfo | null>(null)

  useEffect(() => {
    const loadToken = async () => {
      try {
        const token = await SecureStore.getItemAsync('token')
        if (!token) return
        const decodedToken = jwtDecode<IJwtTokenInfo>(token)
        if (decodedToken.exp * 1000 < Date.now()) {
          await SecureStore.deleteItemAsync('token')
          return
        }
        setUser(decodedToken)
        setToken(token)
      } catch (error) {
        await SecureStore.deleteItemAsync('token')
        console.log('Error loading token: ', error)
      }
    }

    loadToken()
  }, [])

  const login = async (newToken: string) => {
    try {
      const decodedToken = jwtDecode<IJwtTokenInfo>(newToken)

      if (decodedToken.exp * 1000 < Date.now()) {
        return
      }
      await SecureStore.setItemAsync('token', newToken)
      setUser(decodedToken)
      setToken(newToken)
    } catch (error) {
      console.log('Error logging in: ', error)
    }
  }

  const logout = async () => {
    await SecureStore.deleteItemAsync('token')
    setUser(null)
    setToken(null)
  }

  const isLoggedIn = !!token

  return (
    <AuthContext.Provider
      value={{
        token,
        login,
        logout,
        isLoggedIn,
        user,
      }}
    >
      {children}
    </AuthContext.Provider>
  )
}

export const useAuthContext = () => {
  const context = useContext(AuthContext)
  if (!context) throw new Error('useAuth must be used within a AuthProvider')
  return context
}
