import { ThemedText } from '@/components/themed-text'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { ViewAnnotation } from '@maplibre/maplibre-react-native'
import { memo } from 'react'
import { StyleSheet, View } from 'react-native'

interface IMarkerContainerProps {
  longitude: number
  latitude: number
  containerId: number
  fillingLevel: number
  onTap: (conatinerId: number) => void
}

export const MarkerContainer = memo(
  ({
    longitude,
    latitude,
    containerId,
    fillingLevel,
    onTap,
  }: IMarkerContainerProps) => {
    const value = `${Math.round(fillingLevel * 100)}%`
    const theme = useTheme()

    return (
      <ViewAnnotation
        key={`${containerId}-${Math.round(fillingLevel * 100)}`}
        lngLat={[longitude, latitude]}
        onPress={() => onTap(containerId)}
      >
        <View style={styles.container}>
          <View
            style={[
              styles.fillingLevelBack,
              { backgroundColor: theme.background },
            ]}
          >
            <ThemedText>{value}</ThemedText>
          </View>
          <View style={styles.markerWrapper}>
            <Ionicons
              name='trash-sharp'
              size={24}
              color={fillingLevel > 0.7 ? theme.greenAccent : theme.textError}
            />
          </View>
        </View>
      </ViewAnnotation>
    )
  },
  (prev, next) => {
    return prev.fillingLevel === next.fillingLevel && prev.onTap === next.onTap
  },
)

const styles = StyleSheet.create({
  container: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
  markerWrapper: {
    width: 26,
    height: 26,
    justifyContent: 'center',
    alignItems: 'center',
  },
  fillingLevelBack: {
    padding: 4,
    borderRadius: 4,
    borderWidth: 1,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
})
