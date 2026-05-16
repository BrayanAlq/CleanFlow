import polyline from "@mapbox/polyline"

interface ShapeRouteProps {
  polyline: string
  className?: string
}

export const ShapeRoute = ({ polyline: plString, className }: ShapeRouteProps) => {
  const points = polyline.decode(plString)
  
  if (points.length === 0) return null

  const lats = points.map(([lat]) => lat)
  const lngs = points.map(([, lng]) => lng)

  const minLat = Math.min(...lats)
  const maxLat = Math.max(...lats)
  const minLng = Math.min(...lngs)
  const maxLng = Math.max(...lngs)

  const pad = 4
  const W = 100
  const H = 100

  const scaleX = (W - pad * 2) / (maxLng - minLng || 1)
  const scaleY = (H - pad * 2) / (maxLat - minLat || 1)
  const scale = Math.min(scaleX, scaleY)

  const offX = (W - (maxLng - minLng) * scale) / 2
  const offY = (H - (maxLat - minLat) * scale) / 2

  const toSVG = ([lat, lng]: number[]) => [
    offX + (lng - minLng) * scale,
    H - offY - (lat - minLat) * scale, // invertir Y
  ]

  const d = points
    .map((p, i) => {
      const [x, y] = toSVG(p)
      return `${i === 0 ? "M" : "L"}${x.toFixed(2)},${y.toFixed(2)}`
    })
    .join(" ")

  return (
    <svg
      className={className}
      viewBox={`0 0 ${W} ${H}`}
      xmlns="http://www.w3.org/2000/svg"
      style={{ width: "100%", height: "100%" }}
    >
      <path
        d={d}
        fill="none"
        stroke="currentColor"
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  )
}