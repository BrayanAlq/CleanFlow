import { MapContainer, Marker, TileLayer } from "react-leaflet"
import type { IMessage } from "@stomp/stompjs"
import { useEffect, useState } from "react"

import "leaflet/dist/leaflet.css"
import L from "leaflet"
import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png"
import markerIcon from "leaflet/dist/images/marker-icon.png"
import markerShadow from "leaflet/dist/images/marker-shadow.png"

import driverSvg from '@/assets/driver.svg?raw'
import trashSvg from '@/assets/trash.svg?raw'

import { useContainerInViewport } from "@/hooks/useContainer"
import { useStoreContainer } from "@/store/useStoreContainer"
import { Container } from "@/components/MapManager/Container"
import { useStomp } from "@/context/StompContext"
import type { DriverType } from "@/models/driver.model"
import { getBounds, type BoundType } from "@/models/bound.model"
import { MapEventHandler } from "@/components/MapManager/MapHandler"

delete (L.Icon.Default.prototype as any)._getIconUrl
L.Icon.Default.mergeOptions({
  iconUrl: markerIcon,
  iconRetinaUrl: markerIcon2x,
  shadowUrl: markerShadow,
})

const driverIcon = L.divIcon({
  className: '',
  html: driverSvg,
  iconSize: [36, 36],
  iconAnchor: [18, 18],
})

const trashIcon = L.divIcon({
  className: '',
  html: trashSvg,
  iconSize: [36, 36],
  iconAnchor: [18, 18],
})

export const MapManageScreen = () => {
  const [bounds, setBounds] = useState<BoundType | null>(null)
  const { data: containers = [] } = useContainerInViewport(bounds)
  const setSelectedId = useStoreContainer((s) => s.setSelectedId)
  const [drivers, setDrivers] = useState<DriverType[]>([])

  const { connected, subscribe, publish } = useStomp()

  useEffect(() => {
    if (!connected) return
    const driverSub = subscribe(
      '/user/queue/drivers',
      (msg: IMessage) => {
        const driver = JSON.parse(msg.body) as DriverType
        setDrivers(prev => {
          const existing = prev.find(d => d.id === driver.id)
          return existing
            ? prev.map(d => d.id === driver.id ? driver : d)
            : [...prev, driver]
        })
      }
    )

    const metricSub = subscribe(
      '/user/queue/metrics',
      (msg: IMessage) => {
        const metric = JSON.parse(msg.body)
        console.log(metric)
      }
    )
    return () => {
      driverSub?.unsubscribe()
      metricSub?.unsubscribe()
    }
  }, [connected])

  useEffect(() => {
    if (!connected || !bounds) return
    publish('/app/viewport.update', bounds)
  }, [bounds, connected])

  return (
    <div
      className="h-[96vh] rounded-xl w-[97%] border-[0.1px] border-border-accent relative overflow-hidden"
    >
      <MapContainer
        key="main-map"
        zoomControl={false}
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
                icon={trashIcon}
              />
            )
          })
        }
        {
          drivers && drivers.map(({ id, latitude, longitude }) => (
            <Marker
              key={id} position={[latitude, longitude]}
              icon={driverIcon}
            />
          ))
        }
      </MapContainer>
      <Container />
    </div>
  )
}