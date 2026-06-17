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
  tooltipVisible?: boolean
  iconVisible?: boolean
}

export const MarkerContainer = memo(
  ({ longitude, latitude, containerId, fillingLevel, onTap, tooltipVisible, iconVisible }: IMarkerContainerProps) => {
    const value = `${Math.round(fillingLevel * 100)}%`
    const theme = useTheme()

    return (
      <ViewAnnotation
        key={`${containerId}-${fillingLevel}-${iconVisible}-${tooltipVisible}`}
        lngLat={[longitude, latitude]}
        onPress={() => onTap(containerId)}
      >
        <View style={styles.container}>
          <View
            style={[styles.fillingLevelBack, { backgroundColor: theme.background, opacity: tooltipVisible ? 1 : 0 }]}
          >
            <ThemedText>{value}</ThemedText>
          </View>
          <View style={[styles.markerWrapper, { opacity: iconVisible ? 1 : 0 }]}>
            <Ionicons name="trash-sharp" size={24} color={fillingLevel > 0.7 ? theme.greenAccent : theme.textError} />
          </View>
        </View>
      </ViewAnnotation>
    )
  },
  (prev, next) =>
    prev.fillingLevel === next.fillingLevel &&
    prev.onTap === next.onTap &&
    prev.iconVisible === next.iconVisible &&
    prev.tooltipVisible === next.tooltipVisible,
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
