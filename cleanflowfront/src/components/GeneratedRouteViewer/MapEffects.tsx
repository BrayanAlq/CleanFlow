import { useEffect } from "react"
import { useMap } from "react-leaflet"
import polyline from "@mapbox/polyline"
import L from "leaflet"
import type { GeneratedRouteType } from "@/models/generated.route.model"

interface MapEffectsProps {
  selectedGereneratedRouteId: number | null
  generatedRoutes: GeneratedRouteType[]
}

export const MapEffects = ({ selectedGereneratedRouteId, generatedRoutes }: MapEffectsProps) => {
  const map = useMap()

  useEffect(() => {
    const selectedRoute = generatedRoutes?.find(r => r.id === selectedGereneratedRouteId)
    if (!selectedRoute?.polylines) return

    const positions = selectedRoute.polylines.flatMap(p => polyline.decode(p.polyline) as [number, number][])
    const bounds = L.latLngBounds(positions)

    map.fitBounds(bounds, {
      padding: [60, 60],
      animate: true,
      maxZoom: 16,
    })
  }, [selectedGereneratedRouteId, generatedRoutes, map])

  return null
}