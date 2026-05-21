import { Filters } from "@/components/RouteViewer/Filters"
import { useState } from "react"
import { GeneratedRoutesContainer } from "@/components/GeneratedRouteViewer/GeneratedRoutesContainer"

export const DriverContainer = () => {
  const [driverId, setDriverId] = useState<number | undefined>()
  const [date, setDate] = useState<string | undefined>()

  return (
    <div
      className="absolute w-90 h-120 rounded-2xl bg-bg-secondary top-5 right-5 z-1000 border-border-accent border-[0.1px] shadow-2xs overflow-hidden flex flex-col p-5 text-white font-normal gap-2"
    >
      <h1>Rutas Generadas</h1>
      <hr className="border-border-accent border-[0.1px] w-full" />
      <Filters
        driverId={driverId}
        onDriverChange={setDriverId}
        date={date}
        onDateChange={setDate}
      />
      <GeneratedRoutesContainer
        driverId={driverId}
        date={date}
      />
    </div>
  )
}