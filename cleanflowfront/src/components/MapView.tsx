import { MapContainer, Marker, TileLayer, useMapEvents } from "react-leaflet"
import { useState } from "react"
import "leaflet/dist/leaflet.css"

import L from "leaflet"
import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png"
import markerIcon from "leaflet/dist/images/marker-icon.png"
import markerShadow from "leaflet/dist/images/marker-shadow.png"

import { useContainerInViewport } from "../hooks/useContainer"
import { useStoreContainer } from "../store/useStoreContainer"
import { Container } from "./Container"

delete (L.Icon.Default.prototype as any)._getIconUrl
L.Icon.Default.mergeOptions({
  iconUrl: markerIcon,
  iconRetinaUrl: markerIcon2x,
  shadowUrl: markerShadow,
})

export interface BoundType {
  north: number,
  south: number,
  east: number,
  west: number
}

const getBounds = (map: L.Map) => {
  const bounds = map.getBounds()
  return {
    north: bounds.getNorth(),
    south: bounds.getSouth(),
    east: bounds.getEast(),
    west: bounds.getWest()
  }
}

const MapEventHandler = ({ onMove }: { onMove: (bounds: BoundType) => void }) => {
  const map = useMapEvents({
    moveend: () => onMove(getBounds(map)),
    zoomend: () => onMove(getBounds(map)),
    load: () => onMove(getBounds(map)),
  })
  return null
}

export const MapView = () => {
  const [bounds, setBounds] = useState<BoundType | null>(null)
  const { data: containers = [] } = useContainerInViewport(bounds)
  const setSelectedId = useStoreContainer((s) => s.setSelectedId)

  return (
    <div
      className="h-[96vh] rounded-2xl w-[90%] border-[0.1px] border-border-accent relative overflow-hidden"
    >
      <MapContainer
        key="main-map"
        className="h-full w-full"
        center={[-12.088, -77.016]}
        zoom={17}
        whenReady={function (this: L.Map) { setBounds(getBounds(this)) }}
      >
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution="© OpenStreetMap contributors"
        />
        <MapEventHandler onMove={setBounds} />
        {
          containers.map(({ id, latitude, longitude }) => {
            return (
              <Marker
                key={id} position={[latitude, longitude]}
                eventHandlers={{ click: () => setSelectedId(id) }}
              />
            )
          })
        }
      </MapContainer>
      <Container />
    </div>
  )
}