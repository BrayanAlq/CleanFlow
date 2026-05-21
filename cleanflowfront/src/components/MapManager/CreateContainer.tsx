import { Input } from "@/components/Input"
import { useCreateContainer } from "@/hooks/useContainer"
import { IconCamera } from "@/icons/IconCamera"
import { toTwoDecimals } from "@/utils/formatNumber"
import { useRef, useState, type ChangeEvent, type Dispatch, type SetStateAction } from "react"
import { toast } from "sonner"

interface ErrorsType {
  nameContainer?: string,
  address?: string,
  latitude?: string,
  longitude?: string,
  file?: string,
}

interface CreateContainerProps {
  latitude: number,
  longitude: number,
  onEnd: Dispatch<SetStateAction<boolean>>
}

export const CreateContainer = ({ latitude, longitude, onEnd }: CreateContainerProps) => {
  const [nameContainer, setNameContainer] = useState("")
  const [address, setAddress] = useState("")
  const [file, setFile] = useState<File | null>(null)
  const [errors, setErrors] = useState<ErrorsType>({})
  const { mutate } = useCreateContainer()

  const fileInputRef = useRef<HTMLInputElement>(null)

  const handleCameraClick = () => {
    fileInputRef.current?.click()
  }

  const handleFileUpload = (e: ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files ?? [])
    if (files.length === 0) return

    setFile(files[0])
  }

  const handleSubmit = (e : React.SubmitEvent<HTMLFormElement>) => {
    e.preventDefault()
    const newErrors: ErrorsType = {}
    if (!nameContainer.trim()) newErrors.nameContainer = 'El campo nombre del contenedor es obligatorio'
    if (!address.trim()) newErrors.address = 'El campo dirección es obligatorio'
    if (!latitude) newErrors.latitude = 'El campo latitud es obligatorio'
    if (!longitude) newErrors.longitude = 'El campo longitud es obligatorio'
    if (!file) newErrors.file = 'El campo archivo es obligatorio'

    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors)
      return
    }

    mutate({
      container: {
        name: nameContainer,
        address_name: address,
        latitude,
        longitude
      },
      image: file!
    })

    onEnd(prev => !prev)
    toast.success('Contenedor creado exitosamente')
  }

  return (
    <form
      onSubmit={handleSubmit}
      className="absolute w-90 h-auto rounded-xl bg-bg-secondary top-5 right-5 z-1000 border-border-accent border-[0.1px] shadow-2xs overflow-hidden flex flex-col font-normal p-4 text-tiny gap-2"
    >
      <Input
        name="Nombre del contenedor"
        type="text"
        placeholder="Ingrese el nombre del contenedor"
        value={nameContainer}
        errors={errors.nameContainer}
        onChange={(e) => setNameContainer(e.target.value)}
        labelStyle="text-xs text-white"
        inputStyle="text-xs border-border-accent text-white bg-black/20"
      />
      <Input
        name="Dirección"
        type="text"
        placeholder="Ingrese la dirección"
        value={address}
        errors={errors.address}
        onChange={(e) => setAddress(e.target.value)}
        labelStyle="text-xs text-white"
        inputStyle="text-xs border-border-accent text-white bg-black/20"
      />
      <div className="w-full flex">
        <div className="w-1/2 pr-1">
          <Input
            name="Latitud"
            type="text"
            readonly
            placeholder="Ingrese la latitud"
            value={toTwoDecimals(latitude)}
            errors={errors.latitude}
            labelStyle="text-xs text-white"
            inputStyle="text-xs border-border-accent text-white bg-black/20"
          />
        </div>
        <div className="w-1/2 pl-1">
          <Input
            name="Longitud"
            type="text"
            readonly
            placeholder="Ingrese la longitud"
            value={toTwoDecimals(longitude)}
            errors={errors.longitude}
            labelStyle="text-xs text-white"
            inputStyle="text-xs border-border-accent text-white bg-black/20"
          />
        </div>
      </div>
      <div className="w-full flex h-10 gap-2">
        <input
          ref={fileInputRef}
          type="file"
          multiple={false}
          className="hidden"
          accept="image/*"
          onChange={handleFileUpload}
        />
        <div className={`h-full flex-1 text-xs border-border-accent border-[0.1px] rounded-lg bg-black/20 px-2 content-center text-white/50 truncate ${errors.file ? 'border-red-500' : ''}`}>
          {file?.name ?? 'Seleccione un archivo'}
        </div>
        <button
          type="button"
          onClick={handleCameraClick}
        >
          <IconCamera className="h-full w-10 bg-tertiary/70 rounded-lg text-black cursor-pointer hover:bg-white/10 hover:text-white active:scale-105 transition-all duration-300 ease-in-out" />
        </button>
      </div>
      <button
        type="submit"
        className="w-full h-10 bg-tertiary/80 p-2 rounded-lg text-xs text-black hover:bg-white/10 hover:text-white cursor-pointer active:scale-95 transition-all duration-75 ease-in-out"
      >
        Crear Contenedor
      </button>
    </form>
  )
}