export interface BoundType {
  north: number,
  south: number,
  east: number,
  west: number
}

export const getBounds = (map: L.Map) => {
  const bounds = map.getBounds()
  return {
    north: bounds.getNorth(),
    south: bounds.getSouth(),
    east: bounds.getEast(),
    west: bounds.getWest()
  }
}