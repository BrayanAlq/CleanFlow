import { cloneElement, useState, type HTMLAttributes, type ReactElement } from "react"

type ExpandableImageProps = {
  path: string,
  children: ReactElement<HTMLAttributes<HTMLElement>>,
}

export const ExpandableImage = ({ path, children }: ExpandableImageProps) => {
  const [isOpen, setIsOpen] = useState(false)

  const trigger = cloneElement(children, {
    onClick: () => setIsOpen(true),
    style: { cursor: "pointer" },
  })

  return (
    <>
      {trigger}
      {isOpen && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm bg-black/50"
          onClick={() => setIsOpen(false)}
        >
          <button
            className="absolute top-4 right-4 text-white bg-black/50 cursor-pointer rounded-full w-8 h-8 flex items-center justify-center hover:bg-black/80 transition-colors"
            onClick={() => setIsOpen(false)}
            aria-label="Cerrar"
          >
            ✕
          </button>
          <img
            src={path}
            alt="report fullscreen"
            className="max-h-[90vh] h-[90vh] max-w-auto rounded-lg object-cover shadow-2xl"
            onClick={e => e.stopPropagation()} // evita cerrar al clickear la imagen
          />
        </div>
      )}
    </>
  )
}