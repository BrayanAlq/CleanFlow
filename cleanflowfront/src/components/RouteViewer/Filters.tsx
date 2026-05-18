import { getDrivers } from "@/service/adminService"
import { useQuery } from "@tanstack/react-query"
import { toast } from "sonner"

interface FiltersProps {
  driverId?: number
  date?: string
  onDriverChange: (value?: number) => void
  onDateChange: (value?: string) => void
}

export const Filters = ({ driverId, onDriverChange, date, onDateChange }: FiltersProps) => {
  const { data: drivers } = useQuery({
    queryKey: ['admin', 'driver'],
    queryFn: () => getDrivers(),
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onError: (error: Error) => {
        toast.error('Error al cargar conductores', {
          description: error.message,
        })
      }
    }
  })

  return (
    <div className="flex flex-row gap-2">
      <div className="relative w-7/12 flex">
        <select
          value={driverId ?? ''}
          onChange={(e) => {
            const value = e.target.value
            onDriverChange(
              value ? Number(value) : undefined
            )
          }}
          defaultValue=""
          className="appearance-none w-full border-border-accent border-[0.1px] rounded-lg p-2 cursor-pointer text-tiny bg-black/20"
        >
          <option value="" disabled selected hidden>Seleccione un conductor</option>
          {
            drivers?.map(({ id, first_name, last_name }) => (
              <option key={id} value={id}>{first_name} {last_name}</option>
            ))
          }
        </select>
      </div>
      <input
        value={date ?? ''}
        onChange={(e) => {
          onDateChange(
            e.target.value || undefined
          )
        }}
        type="date"
        className="w-5/12 border-border-accent border-[0.1px] rounded-lg p-2 outline-none text-tiny cursor-text bg-black/20"
      />
    </div>
  )
}