import { getBounds, type BoundType } from "@/models/bound.model"
import { useMapEvents } from "react-leaflet"

export const MapEventHandler = ({ onMove }: { onMove: (bounds: BoundType) => void }) => {
  const map = useMapEvents({
    moveend: () => onMove(getBounds(map)),
    zoomend: () => onMove(getBounds(map)),
    load: () => onMove(getBounds(map)),
  })
  return null
}