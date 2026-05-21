import { useEffect, useRef } from "react"
import { Polyline, useMap } from "react-leaflet"

interface RoutePolylineProps {
  positions: [number, number][]
  selected: boolean,
  color: string
}

export const RoutePolyline = ({ positions, selected, color }: RoutePolylineProps) => {
  const ref = useRef<any>(null)
  const map = useMap()

  useEffect(() => {
    if (ref.current) {
      ref.current.setStyle({
        color:  color,
        weight: selected ? 6 : 3,
      })
    }
  }, [selected, positions, map])

  return (
    <Polyline
      ref={ref}
      positions={positions}
      color={'blue'} // fallback inicial
      weight={selected ? 8 : 5}
    />
  )
}