import { IContainerImageType, IContainerMetric } from './container'
import { IDriverProfile } from './driver'

export interface IPolyline {
  id: number
  polyline: string
}

export interface IScheduledContainer {
  container_id: number
  name: string
  address_name: string
  latitude: number
  longitude: number
  image: IContainerImageType
  visit_order: number
  last_metric: IContainerMetric
}

export interface IScheduledRoute {
  id: number
  polylines: IPolyline[]
  driver: IDriverProfile
  created_at: string
  containers: IScheduledContainer[]
}
