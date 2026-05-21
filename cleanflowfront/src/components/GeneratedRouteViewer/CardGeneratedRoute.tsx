import { formatToDate } from "@/utils/dateutils"
import { ShapeRoute } from "@/components/RouteViewer/ShapeRoute"
import { IconCalendar } from "@/icons/IconCalendar"
import { useStoreGeneratedRoutes } from "@/store/useStoreGeneratedRoutes"

interface CardGeneratedRouteProps {
  id: number
  name: string
  polyline: string
  created_at: string
}

export const CardGeneratedRoute = ({ id, name, created_at, polyline }: CardGeneratedRouteProps) => {
  const setSelectedGeneratedRouteId = useStoreGeneratedRoutes((r) => r.setSelectedGeneratedRouteId)
  return (
    <div
      onClick={() => {
        setSelectedGeneratedRouteId(id)
      }}
      className="flex w-full h-16 px-1 gap-2 items-center rounded-lg text-tiny cursor-pointer bg-black/20 hover:bg-white/10"
    >
      <div
        className="w-14 h-14 rounded-md p-2 bg-sky-200/80 hover:cursor-pointer"
      >
        {
          polyline && <ShapeRoute
            key={`${id}-shape`}
            polyline={polyline}
            className="w-full h-full text-black"
          />
        }
      </div>
      <div className="flex flex-col flex-1 h-16 rounded-sm p-2 text-white">
        <p>{name}</p>
        <div className="flex items-center gap-1">
          <IconCalendar className="w-3 h-3" />
          <p>{formatToDate(created_at)}</p>
        </div>
      </div>
    </div>
  )
}