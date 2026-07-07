import { BadgeInfo } from '@/components/map-screen/badge-info'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { ImageViewer } from '@/components/ui/image-viewer'
import { CONTAINER_TYPES } from '@/constants/container'
import { useTheme } from '@/hooks/use-theme'
import { IContainerType } from '@/types/container'
import { EvilIcons, Feather, Fontisto, MaterialIcons } from '@expo/vector-icons'
import { useState } from 'react'
import { Image, Pressable, StyleSheet } from 'react-native'
import { ScrollView } from 'react-native-gesture-handler'

interface IContainerInfoProps {
  container: IContainerType
}

export const ContainerInfo = ({ container }: IContainerInfoProps) => {
  const [selectedImage, setSelectedImage] = useState<string | null>(null)

  const theme = useTheme()

  const { name, address_name, container_image, last_metric } = container

  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <Pressable onPress={() => setSelectedImage(container_image.url)}>
        <ThemedView style={styles.imageContainer}>
          <Image style={styles.imageWrapper} source={{ uri: container_image.url }} />
        </ThemedView>
      </Pressable>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        <ThemedView type="backgroundElement" style={styles.textContainer}>
          <ThemedText>{name}</ThemedText>

          <ThemedView type="backgroundElement" style={styles.infoNoNameContainer}>
            <ThemedView type="backgroundElement" style={styles.addressContainer}>
              <Feather name="map-pin" size={12} color={theme.text} />
              <ThemedText themeColor="textSecondary">{address_name}</ThemedText>
            </ThemedView>
            {last_metric ? (
              <ThemedView style={styles.metricsContainer}>
                <BadgeInfo data={last_metric.is_alive ? 'Trabajando' : 'Inactivo'}>
                  <Feather name="activity" size={18} color={theme.text} />
                </BadgeInfo>
                <BadgeInfo data={CONTAINER_TYPES[last_metric.air_quality_level] ?? 'No hay datos'}>
                  <MaterialIcons name="air" size={18} color={theme.text} />
                </BadgeInfo>
                <BadgeInfo data={last_metric.ppm}>
                  <Fontisto name="atom" size={18} color={theme.text} />
                </BadgeInfo>
                <BadgeInfo data={`${Math.round((last_metric.filling_level ?? 0) * 100)}%`}>
                  <EvilIcons name="trash" size={18} color={theme.text} />
                </BadgeInfo>
              </ThemedView>
            ) : (
              <ThemedText themeColor="textSecondary">No hay métricas aún.</ThemedText>
            )}
          </ThemedView>
        </ThemedView>
      </ScrollView>
      <ImageViewer uri={selectedImage} onClose={() => setSelectedImage(null)} />
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    display: 'flex',
    flexDirection: 'row',
    gap: 12,
    height: 100,
    paddingHorizontal: 16,
  },
  imageContainer: {
    width: 100,
  },
  imageWrapper: {
    width: '100%',
    height: '100%',
    borderRadius: 12,
  },
  addressContainer: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
  },
  textContainer: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'flex-start',
    paddingVertical: 8,
  },
  infoNoNameContainer: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'flex-start',
    justifyContent: 'flex-end',
  },
  metricsContainer: {
    display: 'flex',
    flexDirection: 'row',
    gap: 4,
    justifyContent: 'space-between',
  },
})
