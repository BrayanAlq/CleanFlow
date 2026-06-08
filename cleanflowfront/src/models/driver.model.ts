export interface DriverType {
  id: number,
  latitude: number,
  longitude: number,
}

export interface DriverInfoType {
  id: number,
  username: string,
  first_name: string,
  last_name: string,
  email: string,
  enabled: boolean,
}

export type CreateDriverPayload = {
  username: string,
  password: string,
  email: string,
  first_name: string,
  last_name: string,
}