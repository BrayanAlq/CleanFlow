import { formatDate } from "@/utils/dateutils"
import { ShapeRoute } from "@/components/RouteViewer/ShapeRoute"
import { useStoreRoute } from "@/store/useStoreRoute"

interface CardRouteProps {
  id: number
  name: string
  startTime: string
  endTime: string
  polyline: string
}

export const CardRoute = ({ id, name, startTime, endTime, polyline }: CardRouteProps) => {
  const setSelectedRouteId = useStoreRoute((r) => r.setSelectedRouteId)
  return (
    <div className="flex w-full h-20 px-2 gap-2 items-center rounded-lg text-tiny leading-4">
      <div
        onMouseEnter={() => {
          setSelectedRouteId(id)
        }}
        onMouseLeave={() => setSelectedRouteId(null)}
        className="w-16 h-16 rounded-sm p-2 bg-sky-200 hover:cursor-pointer"
      >
        <ShapeRoute
          polyline={polyline}
          className="w-full h-full text-black"
        />
      </div>
      <div className="flex flex-col flex-1 h-16 rounded-sm p-2 text-white">
        <p>Conductor: {name}</p>
        <p>Inicio: {formatDate(startTime)}</p>
        <p>Fin: {formatDate(endTime)}</p>
      </div>
    </div>
  )
}