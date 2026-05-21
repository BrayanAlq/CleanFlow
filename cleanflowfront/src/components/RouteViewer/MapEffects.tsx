import type { RouteType } from "@/models/route.mode"
import { useEffect } from "react"
import { useMap } from "react-leaflet"
import polyline from "@mapbox/polyline"
import L from "leaflet"

interface MapEffectsProps {
  selectedRouteId: number | null
  routes: RouteType[]
}

export const MapEffects = ({ selectedRouteId, routes }: MapEffectsProps) => {
  const map = useMap()

  useEffect(() => {
    const selectedRoute = routes?.find(r => r.id === selectedRouteId)
    if (!selectedRoute?.polyline) return

    const positions = polyline.decode(selectedRoute.polyline)
    const bounds = L.latLngBounds(positions)

    map.fitBounds(bounds, {
      padding: [60, 60],
      animate: true,
      maxZoom: 16,
    })
  }, [selectedRouteId, routes, map])

  return null
}