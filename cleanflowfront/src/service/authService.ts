import axiosInstance from "../api/axiosInstance";

interface LoginResponse {
  token: string,
}

export async function login(username: string, password: string) {
  const response = await axiosInstance.post<LoginResponse>(
    `/auth/login`,
    { username, password },
    {
      headers: {
        'Content-Type': 'application/json',
      }
    }
  )

  return response.data
}