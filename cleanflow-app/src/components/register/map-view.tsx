import {
  Camera,
  CameraRef,
  Map,
  ViewStateChangeEvent,
} from '@maplibre/maplibre-react-native'
import { ReactNode, useEffect, useRef } from 'react'
import { NativeSyntheticEvent, StyleSheet } from 'react-native'

interface IMapViewProps {
  children?: ReactNode
  center: [number, number]
  shouldCenter?: boolean
  onBoundsChange?: (e: NativeSyntheticEvent<ViewStateChangeEvent>) => void
}

export const MapView = ({
  children,
  center,
  shouldCenter,
  onBoundsChange,
}: IMapViewProps) => {
  const cameraRef = useRef<CameraRef>(null)

  useEffect(() => {
    if (!shouldCenter) return
    cameraRef.current?.jumpTo({ center })
  }, [shouldCenter])

  return (
    <Map
      style={styles.map}
      mapStyle='https://tiles.openfreemap.org/styles/liberty'
      logo={false}
      attribution={false}
      onRegionDidChange={onBoundsChange}
    >
      <Camera ref={cameraRef} initialViewState={{ center, zoom: 14 }} />
      {children}
    </Map>
  )
}

const styles = StyleSheet.create({
  map: { flex: 1, width: '100%' },
})
