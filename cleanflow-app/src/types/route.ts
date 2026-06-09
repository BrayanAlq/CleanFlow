import { IDriverProfile } from './driver'

export interface IPolyline {
  id: number
  polyline: string
}

export interface IScheduledRoute {
  id: number
  polylines: IPolyline[]
  driver: IDriverProfile
  created_at: string
}
