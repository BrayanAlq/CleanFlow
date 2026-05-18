import { useContainerInViewport } from "@/hooks/useContainer"
import { getBounds, type BoundType } from "@/models/bound.model"
import { useMemo, useState } from "react"
import { MapContainer, Marker, TileLayer } from "react-leaflet"
import polyline from "@mapbox/polyline"

import trashSvg from '@/assets/trash.svg?raw'

import L from "leaflet"
import "leaflet/dist/leaflet.css"
import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png"
import markerIcon from "leaflet/dist/images/marker-icon.png"
import markerShadow from "leaflet/dist/images/marker-shadow.png"
import { MapEventHandler } from "@/components/MapManager/MapHandler"
import { DriverContainer } from "@/components/RouteViewer/DriverContainer"
import { useStoreRoute } from "@/store/useStoreRoute"
import { RoutePolyline } from "@/components/RouteViewer/RoutePolyline"

delete (L.Icon.Default.prototype as any)._getIconUrl
L.Icon.Default.mergeOptions({
  iconUrl: markerIcon,
  iconRetinaUrl: markerIcon2x,
  shadowUrl: markerShadow,
})

const trashIcon = L.divIcon({
  className: '',
  html: trashSvg,
  iconSize: [36, 36],
  iconAnchor: [18, 18],
})

export const RouteViewerScreen = () => {
  const [bounds, setBounds] = useState<BoundType | null>(null)
  const { data: containers = [] } = useContainerInViewport(bounds)
  const routes = useStoreRoute((r) => r.routes)
  const selectedRouteId = useStoreRoute((r) => r.selectedRouteId)

  const decodedRoutes = useMemo(() => {
    return routes.map((route) => ({
      id: route.id,
      positions: polyline.decode(route.polyline) as [number, number][],
    }))
  }, [routes])

  return (
    <div
      className="h-[96vh] rounded-xl w-[97%] border-[0.1px] border-border-accent relative overflow-hidden"
    >
      <MapContainer
        key="main-map"
        zoomControl={false}
        className="h-full w-full"
        center={[-12.088, -77.016]}
        zoom={16}
        whenReady={function (this: L.Map) { setBounds(getBounds(this)) }}
      >
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution="© OpenStreetMap contributors"
        />
        {
          containers.map(({ id, latitude, longitude }) => {
            return (
              <Marker
                key={id} position={[latitude, longitude]}
                icon={trashIcon}
              />
            )
          })
        }
        {
          decodedRoutes?.map(({ positions, id }) => (
            <RoutePolyline
              key={id}
              positions={positions}
              selected={id === selectedRouteId}
            />
          ))
        }
        <MapEventHandler onMove={setBounds} />
      </MapContainer>
      <DriverContainer />
    </div>
  )
}