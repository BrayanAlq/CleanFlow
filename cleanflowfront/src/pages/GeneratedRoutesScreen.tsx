import { MapEventHandler } from "@/components/MapManager/MapHandler"
import { getBounds, type BoundType } from "@/models/bound.model"
import { Fragment, useMemo, useState } from "react"
import { MapContainer, TileLayer, CircleMarker, Marker } from "react-leaflet"
import polyline from "@mapbox/polyline"
import { useContainerInViewport } from "@/hooks/useContainer"

import trashSvg from '@/assets/trash.svg?raw'
import L from "leaflet"
import "leaflet/dist/leaflet.css"
import { useStoreGeneratedRoutes } from "@/store/useStoreGeneratedRoutes"
import { DriverContainer } from "@/components/GeneratedRouteViewer/DriverContainer"
import { RoutePolyline } from "@/components/RouteViewer/RoutePolyline"
import { palette } from "@/utils/palete"
import { MapEffects } from "@/components/GeneratedRouteViewer/MapEffects"

const trashIcon = L.divIcon({
  className: '',
  html: trashSvg,
  iconSize: [36, 36],
  iconAnchor: [18, 18],
})

export const GeneratedRoutesScreen = () => {
  const [bounds, setBounds] = useState<BoundType | null>(null)
  const { data: containers = [] } = useContainerInViewport(bounds)
  const generatedRoutes = useStoreGeneratedRoutes((r) => r.generatedRoutes)
  const selectedGeneratedRouteId = useStoreGeneratedRoutes((r) => r.selectedGeneratedRouteId)

  const decodedGeneratedRoutes = useMemo(() => {
    if (!generatedRoutes || generatedRoutes.length === 0) return []
    return generatedRoutes
      .filter(gr => gr.polylines != null && gr.polylines.length > 0)
      .map(({ id, driver, created_at, polylines }) => {
        return {
          id, driver, created_at,
          polyline: polylines.flatMap(p => polyline.decode(p.polyline) as [number, number][])
        }
      })

  }, [generatedRoutes])

  const driverColors = useMemo(() => {
    const map = new Map<number, string>()

    if (!Array.isArray(generatedRoutes)) return map

    generatedRoutes?.forEach(gr => {
      if (!map.has(gr.driver.id)) {
        map.set(
          gr.driver.id,
          palette[map.size % palette.length]
        )
      }
    })
    return map
  }, [generatedRoutes])

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
                key={id}
                position={[latitude, longitude]}
                icon={trashIcon}
              />
            )
          })
        }
        <MapEventHandler onMove={setBounds} />
        <MapEffects generatedRoutes={generatedRoutes} selectedGereneratedRouteId={selectedGeneratedRouteId} />
        {
          decodedGeneratedRoutes?.map(({ id, polyline, driver }) => (
            <Fragment key={id}>
              <CircleMarker
                key={`${id}-start`}
                center={polyline[0]}
                radius={8}
                pathOptions={{ color: "green", fillColor: "green" }}
              />
              <RoutePolyline
                key={id}
                positions={polyline}
                color={driverColors.get(driver.id)!}
                selected={id === selectedGeneratedRouteId}
              />
              <CircleMarker
                key={`${id}-end`}
                center={polyline[polyline.length - 1]}
                radius={8}
                pathOptions={{ color: "red", fillColor: "red" }}
              />
            </Fragment>
          ))
        }
      </MapContainer>
      <DriverContainer />
    </div>
  )
}