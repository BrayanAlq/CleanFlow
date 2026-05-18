import { formatToDate, formatToHour } from "@/utils/dateutils"
import { ShapeRoute } from "@/components/RouteViewer/ShapeRoute"
import { useStoreRoute } from "@/store/useStoreRoute"
import { IconCalendar } from "@/icons/IconCalendar"
import { IconClock } from "@/icons/IconClock"

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
    <div
      onClick={() => {
        setSelectedRouteId(id)
      }}
      className="flex w-full h-16 px-1 gap-2 items-center rounded-lg text-tiny cursor-pointer bg-black/20 hover:bg-white/10"
    >
      <div
        className="w-14 h-14 rounded-md p-2 bg-sky-200/80 hover:cursor-pointer"
      >
        <ShapeRoute
          polyline={polyline}
          className="w-full h-full text-black"
        />
      </div>
      <div className="flex flex-col flex-1 h-16 rounded-sm p-2 text-white">
        <p>{name}</p>
        <div className="flex items-center gap-1">
          <IconCalendar className="w-3 h-3" />
          <p>{formatToDate(startTime)}</p>
        </div>
        <div className="flex items-center gap-1">
          <IconClock className="w-3 h-3" />
          <p>{formatToHour(startTime) + ' - ' + formatToHour(endTime)}</p>
        </div>
      </div>
    </div>
  )
}