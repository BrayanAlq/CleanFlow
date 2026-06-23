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

export interface IDriverHomeResponse {
  id: number
  created_at: string
  current_target: IScheduledContainer | null
  cursor: number
  total_count: number
  alive_count: number
  high_priority_count: number
  air_quality_counts: Record<string, number>
}

export interface IScheduledRoute {
  id: number
  polylines: IPolyline[]
  driver: IDriverProfile
  created_at: string
  containers: IScheduledContainer[]
}

export interface ICreateRouteResponse {
  id: number
  start_at: string
  end_at: string
  status: 'STARTED' | 'FINISHED'
}

export interface IFinishRouteRequest {
  route_id: number
  polyline: string
}

export interface IPointResponse {
  id: number
  latitude: number
  longitude: number
  timestamp: string
}
