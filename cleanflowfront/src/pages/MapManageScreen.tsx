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
import { CreateContainer } from "@/components/MapManager/CreateContainer"
import { CreateContainerButtom } from "@/components/MapManager/CreateContainerButtom"
import type { PositionType } from "@/models/position.model"

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
  // create container
  const [isCreating, setIsCreating] = useState(false)
  const [position, setPosition] = useState<PositionType | null>(null)
  const [map, setMap] = useState<L.Map | null>(null)

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

  const handleCreateClick = () => {
    if (!map) return
    const center = map.getCenter()
    setIsCreating(prev => !prev)
    
    setPosition({
      latitude: center.lat,
      longitude: center.lng,
    })
  }

  return (
    <div
      className="h-[96vh] rounded-xl w-[97%] border-[0.1px] border-border-accent relative overflow-hidden"
    >
      <MapContainer
        key="main-map"
        zoomControl={false}
        className="h-full w-full"
        center={[-12.0799, -77.019]}
        zoom={16}
        whenReady={function (this: L.Map) {
          setBounds(getBounds(this))
          setMap(this)
        }}
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
        {
          isCreating && position && <Marker
            position={[position?.latitude, position?.longitude]}
            draggable
            eventHandlers={{
              dragend: (e: L.DragEndEvent) => {
                const marker = e.target as L.Marker
                const latlng = marker.getLatLng()
                
                setPosition({
                  latitude: latlng.lat,
                  longitude: latlng.lng
                })
              }
            }}
          />
        }
      </MapContainer>
      <CreateContainerButtom
        onCreate={handleCreateClick}
      />
      {
        isCreating && <CreateContainer
          latitude={position?.latitude ?? 0}
          longitude={position?.longitude ?? 0}
          onEnd={setIsCreating}
        />
      }
      <Container />
    </div>
  )
}