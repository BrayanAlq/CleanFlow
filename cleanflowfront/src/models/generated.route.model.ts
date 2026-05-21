import type { DriverInfoType } from "@/models/driver.model"

export interface PolylineType {
  id: number,
  polyline: string
}

export interface GeneratedRouteType {
  id: number,
  driver: DriverInfoType,
  polylines: PolylineType[],
  created_at: string,
}