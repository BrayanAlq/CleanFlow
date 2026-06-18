import { IAirQualityLevelType } from '@/types/container'

export const CONTAINER_TYPES: Record<IAirQualityLevelType, string> = {
  NO_DATA: 'No hay datos',
  VERY_GOOD: 'Muy bueno',
  GOOD: 'Bueno',
  REGULAR: 'Regular',
  BAD: 'Malo',
  VERY_BAD: 'Muy malo',
}
