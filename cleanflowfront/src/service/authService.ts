import axiosInstance from "../api/axiosInstance";

export interface LoginResponse {
  token: string,
}

export interface LoginRequest {
  username: string,
  password: string,
}

export async function login({ username, password }: LoginRequest) {
  const response = await axiosInstance.post<LoginResponse>(
    `/auth/login`,
    { username, password }
  )

  return response.data
}