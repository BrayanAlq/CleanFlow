export interface IImageReport {
  id: number
  path: string
}

export interface IUserReport {
  id: number
  username: string
  first_name: string
  last_name: string
  email: string
}

export interface IReport {
  id: number
  content: string
  timestamp: string
  images: IImageReport[]
  user: IUserReport
}
