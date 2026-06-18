import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { ViewAnnotation } from '@maplibre/maplibre-react-native'
import { StyleSheet } from 'react-native'
import { ThemedView } from '../themed-view'

interface IMarkerHomeProps {
  latitude: number
  longitude: number
}

export const MarkerHome = ({ latitude, longitude }: IMarkerHomeProps) => {
  const theme = useTheme()
  return (
    <ViewAnnotation lngLat={[longitude, latitude]}>
      <ThemedView type="transparent" style={styles.externalContainer}>
        <Ionicons name="home" size={20} color={theme.greenAccent} />
      </ThemedView>
    </ViewAnnotation>
  )
}

const styles = StyleSheet.create({
  externalContainer: {
    width: 'auto',
    height: 'auto',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
})
