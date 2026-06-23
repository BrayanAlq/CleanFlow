import { BadgeInfo } from '@/components/map-screen/badge-info'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { IScheduledContainer } from '@/types/route'
import { EvilIcons, Feather, Fontisto } from '@expo/vector-icons'
import { StyleSheet, View } from 'react-native'

interface ICurrentTargetCardProps {
  container: IScheduledContainer
}

export const CurrentTargetCard = ({ container }: ICurrentTargetCardProps) => {
  const theme = useTheme()

  return (
    <ThemedView
      style={[
        styles.card,
        styles.currentTargetCard,
        { borderLeftColor: theme.greenAccent },
      ]}
    >
      <ThemedView style={styles.cardHeaderRow}>
        <View style={[styles.liveDot, { backgroundColor: theme.greenAccent }]} />
        <ThemedText style={styles.cardTitle}>Contenedor actual</ThemedText>
      </ThemedView>
      <ThemedText style={styles.containerName}>{container.name}</ThemedText>
      <ThemedText themeColor="textSecondary" style={styles.addressText}>
        {container.address_name} · #{container.visit_order + 1}
      </ThemedText>
      <ThemedView style={styles.metricsRow}>
        <BadgeInfo data={container.last_metric ? `${Math.round((container.last_metric.filling_level ?? 0) * 100)}%` : 'Sin datos'}>
          <EvilIcons name="trash" size={18} />
        </BadgeInfo>
        <BadgeInfo data={container.last_metric ? (container.last_metric.is_alive ? 'Activo' : 'Inactivo') : 'Sin datos'}>
          <Feather name="activity" size={18} />
        </BadgeInfo>
        <BadgeInfo data={container.last_metric ? `${container.last_metric.ppm} ppm` : 'Sin datos'}>
          <Fontisto name="atom" size={18} />
        </BadgeInfo>
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  card: {
    padding: 16,
    borderRadius: 16,
    elevation: 1,
    gap: 10,
  },
  cardTitle: { fontSize: 15, fontWeight: '600' },
  cardHeaderRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  currentTargetCard: { borderLeftWidth: 3 },
  liveDot: { width: 10, height: 10, borderRadius: 5 },
  containerName: { fontSize: 18, fontWeight: 'bold' },
  addressText: { fontSize: 13 },
  metricsRow: { flexDirection: 'row', gap: 8, flexWrap: 'wrap' },
})
