export interface IContainerImageType {
  id: number
  url: string
}

export type IContainerCodeType = 'ORGANIC' | 'GENERAL' | 'RECYCLABLE'
export type IAirQualityLevelType = 'NO_DATA' | 'VERY_GOOD' | 'GOOD' | 'REGULAR' | 'BAD' | 'VERY_BAD'

export interface IContainerMetric {
  id: number
  container_id: number
  is_alive: boolean
  air_quality_level: IAirQualityLevelType
  ppm: number
  filling_level: number
}

export interface IContainerType {
  id: number
  name: string
  latitude: number
  longitude: number
  address_name: string
  container_image: IContainerImageType
  type: IContainerCodeType
  last_metric: IContainerMetric
}
