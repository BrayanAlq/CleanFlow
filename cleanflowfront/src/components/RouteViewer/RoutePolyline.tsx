import { useEffect, useRef } from "react"
import { Polyline, useMap } from "react-leaflet"

import L from "leaflet"

interface RoutePolylineProps {
  positions: [number, number][]
  selected: boolean
}

export const RoutePolyline = ({ positions, selected }: RoutePolylineProps) => {
  const ref = useRef<any>(null)
  const map = useMap()

  useEffect(() => {
    const bounds = L.latLngBounds(positions)
    map.fitBounds(bounds, {
      padding: [60, 60],
      animate: true,
      maxZoom: 16,
    })

    if (ref.current) {
      ref.current.setStyle({
        color: selected ? "blue" : "red",
        weight: selected ? 6 : 3,
      })
    }
  }, [selected, positions, map])

  return (
    <Polyline
      ref={ref}
      positions={positions}
      color={selected ? "blue" : "red"} // fallback inicial
      weight={selected ? 6 : 3}
    />
  )
}