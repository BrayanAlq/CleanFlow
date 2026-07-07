import { IconResident } from '@/icons/IconResident'
import { IconTrash } from '@/icons/IconTrash'

interface ToggleVisibilityProps {
  onResidentsClick?: () => void
  onContainersClick?: () => void
  residentVisibility: boolean
  containerVisibility: boolean
}
export const ToggleVisibility = ({
  onResidentsClick,
  onContainersClick,
  residentVisibility,
  containerVisibility,
}: ToggleVisibilityProps) => {
  return (
    <div className="absolute w-fit top-5 left-5 z-1000 bg-tertiary/80 p-1 rounded-xl flex gap-1">
      <button
        onClick={onResidentsClick}
        className={`${residentVisibility ? 'bg-bg-secondary text-tertiary' : 'bg-transparent text-bg-secondary'} cursor-pointer rounded-lg p-1 hover:bg-bg-secondary hover:text-tertiary`}
      >
        <IconResident className="w-6 h-6" />
      </button>
      <line className="w-[0.5px] bg-bg-secondary" />
      <button
        onClick={onContainersClick}
        className={`${containerVisibility ? 'bg-bg-secondary text-tertiary' : 'bg-transparent text-bg-secondary'} cursor-pointer rounded-lg p-1 hover:bg-bg-secondary hover:text-tertiary`}
      >
        <IconTrash className="w-6 h-6" />
      </button>
    </div>
  )
}
