import { IconAddress } from "../icons/IconAddress"
import { IconAir } from "../icons/IconAir"
import { IconAlive } from "../icons/IconAlive"
import { IconGarbage } from "../icons/IconGarbage"
import { IconParticles } from "../icons/IconParticles"
import { BadgeItem } from "./BadgeItem"
import { IconOff } from "../icons/IconOff"
import { useStoreContainer } from "../store/useStoreContainer"
import { useQuery } from "@tanstack/react-query"
import { getContainerById } from "../service/containerService"
import { toast } from "sonner"
import { IconClose } from "../icons/IconClose"
import { ExpandableImage } from "./ExpandableImage"

export const ContainerInfo = () => {
  const selectedId = useStoreContainer((s) => s.selectedId)
  const setSelectedId = useStoreContainer((s) => s.setSelectedId)

  const { data: container } = useQuery({
    queryKey: ['container', selectedId],
    queryFn: () => getContainerById(selectedId!),
    enabled: selectedId !== null,
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onError: (error: Error) => {
        toast.error('Error al cargar contenedor', {
          description: error.message,
        })
      }
    }
  })

  return (
    <div className="w-full h-full relative">
      <div
        className="absolute top-2 right-2 cursor-pointer"
        onClick={() => setSelectedId(null)}
      >
        <IconClose className="w-7 h-7 text-black" />
      </div> 
      <div className="h-50 overflow-hidden">
        <ExpandableImage path={container?.container_image.url!}>
          <img className="w-full h-full object-cover object-center" src={container?.container_image?.url} alt="container" />
        </ExpandableImage>
      </div>
      <div className="text-white px-5 py-3 flex flex-col gap-2">
        <h1 className="text-lg font-bold">{container?.name}</h1>
        <div className="flex items-center justify-between gap-1 text-sm">
          <BadgeItem text="Trabajando">
            {
              true ? <IconAlive className="w-4 h-4 text-red-400" /> : <IconOff className="w-4 h-4 text-red-400" />
            }
          </BadgeItem>
          <BadgeItem text="20%">
            <IconAir className="w-4 h-4 text-red-400" />
          </BadgeItem>
          <BadgeItem text="20%">
            <IconParticles className="w-4 h-4 text-red-400" />
          </BadgeItem>
          <BadgeItem text="20%">
            <IconGarbage className="w-4 h-4 text-red-400" />
          </BadgeItem>
        </div>
        <div className="flex items-center gap-1">
          <IconAddress className="w-4 h-4 text-red-400" />
          <p className="text-xs">{container?.address_name}</p>
        </div>
      </div>
    </div>
  )
}