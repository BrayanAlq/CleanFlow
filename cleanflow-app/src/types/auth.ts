export interface ILoginRequest {
  username: string
  password: string
}

export interface ILoginResponse {
  token: string
}

export interface IJwtTokenInfo {
  username: string
  role: 'RESIDENT' | 'DRIVER'
  id: number
  first_name: string
  last_name: string
  exp: number
}

export interface IResidentRequest {
  username: string
  password: string
  email: string
  first_name: string
  last_name: string
  address: string
  longitude: number
  latitude: number
}
