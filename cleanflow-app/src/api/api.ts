import axios from 'axios'
import * as SecureStore from 'expo-secure-store'

const API_URL = process.env.EXPO_PUBLIC_API_REST_URL
const WS_URL = process.env.EXPO_PUBLIC_API_WS_URL

console.log(API_URL)
console.log(WS_URL)

if (!API_URL) {
  throw new Error('EXPO_PUBLIC_API_REST_URL is not defined')
}

if (!WS_URL) {
  throw new Error('EXPO_PUBLIC_API_WS_URL is not defined')
}

export const publicApi = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
})

export const privateApi = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
})

privateApi.interceptors.request.use(async config => {
  const token = await SecureStore.getItemAsync('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})
