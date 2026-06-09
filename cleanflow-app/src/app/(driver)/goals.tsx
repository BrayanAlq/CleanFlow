import { BadgeInfo } from '@/components/map-screen/badge-info'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { StyleSheet } from 'react-native'

export default function Goals() {
  const theme = useTheme()
  return (
    <ThemedView style={styles.container} type="backgroundElement">
      <ThemedText style={styles.title}>Contenedores objetivos</ThemedText>
      <ThemedView type="backgroundElement" style={styles.containersContainer}>
        <ThemedView style={styles.infoContainer}>
          <ThemedView style={styles.imageContainer}></ThemedView>
          <ThemedView style={styles.nameContainer}>
            <ThemedText>Contenedor</ThemedText>
          </ThemedView>
          <ThemedView style={styles.badgeContainer}>
            <BadgeInfo data="Inactivo">
              <Ionicons name="accessibility" size={18} />
            </BadgeInfo>
            <BadgeInfo data="Inactivo">
              <Ionicons name="accessibility" size={18} />
            </BadgeInfo>
          </ThemedView>
        </ThemedView>
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  title: { fontSize: 22, fontWeight: 'bold', marginBottom: 16 },
  containersContainer: {
    height: 'auto',
    borderRadius: 24,
    overflow: 'hidden',
  },
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
  },
  badgeContainer: {
    height: '100%',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-around',
  },
})
