import type { DriverInfoType } from "./driver.model"

export interface RouteType {
  id: number
  start_at: string
  end_at: string
  driver_id: number
  status: string
  polyline: string
  driver: DriverInfoType
}