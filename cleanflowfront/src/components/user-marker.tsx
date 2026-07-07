import L from 'leaflet'

import userSvg from '@/assets/user.svg?raw'
import { Marker, Tooltip } from 'react-leaflet'

const userIcon = L.divIcon({
  className: '',
  html: userSvg,
  iconSize: [36, 36],
  iconAnchor: [18, 18],
})

interface UserMarkerProps {
  id: number
  username: string
  latitude: number
  longitude: number
  visible?: boolean
}
export const UserMarker = ({ id, username, latitude, longitude, visible = true }: UserMarkerProps) => {
  return (
    <>
      <div className="relative">
        <Marker key={id} position={[latitude, longitude]} icon={userIcon} opacity={visible ? 1 : 0}>
          <Tooltip>{username}</Tooltip>
        </Marker>
      </div>
    </>
  )
}
