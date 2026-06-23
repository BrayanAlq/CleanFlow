import { BadgeInfo } from '@/components/map-screen/badge-info'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { EvilIcons, Feather, MaterialIcons } from '@expo/vector-icons'
import { StyleSheet } from 'react-native'

interface IRouteSummaryProps {
  total: number
  aliveCount: number
  highPriorityCount: number
  airQualityCounts: Record<string, number>
}

const airQualityConfig: Record<string, { label: string; color: string }> = {
  VERY_GOOD: { label: 'Muy bueno', color: '#4CAF50' },
  GOOD: { label: 'Bueno', color: '#8BC34A' },
  REGULAR: { label: 'Regular', color: '#FFC107' },
  BAD: { label: 'Malo', color: '#FF5722' },
  VERY_BAD: { label: 'Muy malo', color: '#D32F2F' },
  NO_DATA: { label: 'Sin datos', color: '#9E9E9E' },
}

export const RouteSummary = ({ total, aliveCount, highPriorityCount, airQualityCounts }: IRouteSummaryProps) => {
  const theme = useTheme()

  return (
    <ThemedView style={styles.card}>
      <ThemedView style={styles.cardHeaderRow}>
        <Feather name="list" size={16} />
        <ThemedText style={styles.cardTitle}>Resumen de ruta</ThemedText>
      </ThemedView>
      <ThemedView style={styles.metricsRow}>
        <BadgeInfo data={total}>
          <EvilIcons name="trash" size={18} />
        </BadgeInfo>
        <BadgeInfo data={aliveCount === total ? 'Todos activos' : `${aliveCount}/${total} activos`}>
          <Feather name="activity" size={18} />
        </BadgeInfo>
        {highPriorityCount > 0 && (
          <ThemedView style={[styles.alertBadge, { backgroundColor: theme.textError + '15' }]}>
            <MaterialIcons name="warning" size={16} color={theme.textError} />
            <ThemedText style={[styles.alertText, { color: theme.textError }]}>
              {highPriorityCount} crítico{highPriorityCount > 1 ? 's' : ''}
            </ThemedText>
          </ThemedView>
        )}
        {Object.entries(airQualityCounts).map(([level, count]) => {
          const config = airQualityConfig[level]
          if (!config) return null
          return (
            <ThemedView
              key={level}
              style={[styles.alertBadge, { backgroundColor: config.color + '18' }]}
            >
              <MaterialIcons name="air" size={16} color={config.color} />
              <ThemedText style={[styles.alertText, { color: config.color }]}>
                {count} {config.label.toLowerCase()}
              </ThemedText>
            </ThemedView>
          )
        })}
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
  metricsRow: { flexDirection: 'row', gap: 8, flexWrap: 'wrap' },
  alertBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 8,
  },
  alertText: { fontSize: 13, fontWeight: '600' },
})
