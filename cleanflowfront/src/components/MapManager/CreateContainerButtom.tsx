interface CreateContainerButtomProps {
  onCreate: () => void,
}

export const CreateContainerButtom = ({ onCreate }: CreateContainerButtomProps) => {
  return (
    <div
        className="absolute w-fit top-5 left-5 z-1000 bg-bg-secondary rounded-xl"
      >
        <button
          onClick={onCreate}
          className="relative w-auto z-10 p-2 bg-tertiary/80 text-black border-border-accent border-[0.1px] rounded-xl cursor-pointer font-normal text-xs hover:bg-white/10 hover:text-white"
        >
          Añadir contenedor
        </button>
      </div>
  )
}