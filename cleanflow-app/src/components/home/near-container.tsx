import { BadgeInfo } from '@/components/map-screen/badge-info'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { IContainerMetric } from '@/types/container'
import { EvilIcons, Feather } from '@expo/vector-icons'
import { Image, StyleSheet } from 'react-native'

interface INearContainerProps {
  id: number
  name: string
  image: string
  lastMetric?: IContainerMetric
  distance?: number
}

export const NearContainer = ({ id, name, image, lastMetric, distance }: INearContainerProps) => {
  return (
    <ThemedView key={id} style={styles.infoContainer}>
      <ThemedView style={styles.imageContainer}>
        <Image source={{ uri: image }} style={{ width: '100%', height: '100%' }} />
      </ThemedView>
      <ThemedView style={styles.nameContainer}>
        <ThemedText>{name}</ThemedText>
        <ThemedText type="small">A {Math.floor(distance!)}m de ti</ThemedText>
      </ThemedView>
      <ThemedView style={styles.badgeContainer}>
        {lastMetric ? (
          <>
            <BadgeInfo data={lastMetric.is_alive ? 'Trabajando' : 'Inactivo'}>
              <Feather name="activity" size={18} />
            </BadgeInfo>
            <BadgeInfo data={`${Math.round((lastMetric.filling_level ?? 0) * 100)}%`}>
              <EvilIcons name="trash" size={18} />
            </BadgeInfo>
          </>
        ) : (
          <ThemedText type="small" themeColor="textSecondary">
            No hay datos
          </ThemedText>
        )}
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  infoContainer: {
    height: 100,
    padding: 12,
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: 12,
  },
  nameContainer: {
    flex: 1,
    height: '100%',
    display: 'flex',
    justifyContent: 'center',
  },
  imageContainer: {
    width: 76,
    height: 76,
    backgroundColor: '#ddd',
    borderRadius: 12,
    overflow: 'hidden',
  },
  badgeContainer: {
    height: '100%',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-around',
  },
})
