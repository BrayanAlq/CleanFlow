import { IconCamera } from "@/icons/IconCamera"
import { IconSend } from "@/icons/IconSend"
import { useStoreContainer } from "@/store/useStoreContainer"
import { sendImages } from "@/service/reportService"
import { useStomp } from "@/context/StompContext"
import React, { useRef, useState } from "react"
import { toast } from "sonner"

export const SendReport = () => {
  const [value, setValue] = useState("")
  const [selectedImages, setSelectedImages] = useState<File[]>([])
  const selectedId = useStoreContainer((s) => s.selectedId)
  const fileInputRef = useRef<HTMLInputElement>(null)
  const [isSending, setIsSending] = useState(false)

  const { publish } = useStomp()

  const handleSendReport = async () => {
    if (!value.trim()) return
    setIsSending(true)
    try {
      let imageIds: number[] = []
  
      if (selectedImages.length > 0) {
        const images = await sendImages(selectedImages)
        imageIds = images.map(i => i.id)
      }
  
      publish('/app/reports.create', {
        container_id: selectedId,
        content: value.trim(),
        image_ids: imageIds,
      })
      
      setValue("")
      setSelectedImages([])
    } catch (e: any) {
      toast.error('Error al enviar reporte', {
        description: e.message,
      })
    } finally {
      setIsSending(false)
    }
  }

  const handleCameraClick = () => {
    fileInputRef.current?.click()
  }

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files ?? [])
    if (files.length === 0) return

    setSelectedImages(prev => {
      const existingIds = new Set(prev.map(f => `${f.name}-${f.size}`))
      const newFiles = files.filter(f => !existingIds.has(`${f.name}-${f.size}`))
      return [...prev, ...newFiles]
    })

    e.target.value = ""
  }

  return (
    <div className="flex h-20 gap-2 p-5 border-t-[0.1px] border-t-border-accent">
      <input
        ref={fileInputRef}
        type="file"
        multiple
        accept="image/*"
        onChange={handleFileChange}
        className="hidden"
      />
      <div className="relative shrink-0">
        <button 
          onClick={handleCameraClick}
          className="shrink-0 rounded-lg bg-tertiary/80 cursor-pointer px-2 h-full"
        >
          <IconCamera className="w-6 h-6 text-bg-secondary" />
        </button>
        {selectedImages.length > 0 && (
          <span className="absolute -top-1 -right-1 bg-black text-white text-xs font-bold rounded-full w-4 h-4 flex items-center justify-center leading-none">
            {selectedImages.length}
          </span>
        )}
      </div>
      <input
        className="flex-1 min-w-0 rounded-lg border-[0.1px] border-border-accent px-3 outline-none text-white bg-black/20 text-tiny"
        placeholder="Escribe aquí tu reporte"
        value={value}
        onChange={(e) => setValue(e.target.value)}
        onKeyDown={(e) => e.key === "Enter" && handleSendReport()}
      />
      <button
        onClick={handleSendReport}
        disabled={isSending}
        className="shrink-0 rounded-lg text-sm bg-tertiary/80 cursor-pointer px-2"
      >
        <IconSend className="w-6 h-6 text-bg-secondary" />
      </button>
    </div>
  )
}