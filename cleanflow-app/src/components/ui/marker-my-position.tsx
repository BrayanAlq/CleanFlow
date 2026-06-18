import { useTheme } from '@/hooks/use-theme'
import { ViewAnnotation } from '@maplibre/maplibre-react-native'
import { StyleSheet } from 'react-native'
import { ThemedView } from '../themed-view'

interface IMarkerMyPositionProps {
  id: number
  latitude: number
  longitude: number
}

export const MarkerMyPosition = ({ id, latitude, longitude }: IMarkerMyPositionProps) => {
  const theme = useTheme()
  return (
    <ViewAnnotation key={`mine-${id}`} lngLat={[longitude, latitude]}>
      <ThemedView
        style={[
          styles.externalContainer,
          { backgroundColor: theme.borderDriverMarker, borderColor: theme.borderColor },
        ]}
      >
        <ThemedView style={[styles.internalContainer, { backgroundColor: theme.backgroundMineMarker }]} />
      </ThemedView>
    </ViewAnnotation>
  )
}

const styles = StyleSheet.create({
  externalContainer: {
    width: 20,
    height: 20,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 2,
    borderRadius: '100%',
    borderWidth: 1,
  },
  internalContainer: {
    width: '100%',
    height: '100%',
    borderRadius: '100%',
  },
})
