export interface IDriverProfile {
  id: number
  username: string
  first_name: string
  last_name: string
  email: string
}

export interface IDriverPosition {
  driver_id: number
  longitude: number
  latitude: number
}
