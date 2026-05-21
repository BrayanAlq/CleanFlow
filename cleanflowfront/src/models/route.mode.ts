import type { DriverInfoType } from "./driver.model"

export interface RouteType {
  id: number
  start_at: string
  end_at: string
  status: string
  polyline: string
  driver: DriverInfoType
}