import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { MaterialIcons } from '@expo/vector-icons'
import { StyleSheet, View } from 'react-native'

interface IProgressCardProps {
  progress: number
  isRouteFinished: boolean
  cursor: number
  totalCount: number
}

export const ProgressCard = ({ progress, isRouteFinished, cursor, totalCount }: IProgressCardProps) => {
  const theme = useTheme()

  return (
    <ThemedView style={styles.card}>
      <ThemedView style={styles.cardHeaderRow}>
        <MaterialIcons name="route" size={16} />
        <ThemedText style={styles.cardTitle}>Progreso de ruta</ThemedText>
      </ThemedView>
      <View style={styles.progressBarBg}>
        <View
          style={[
            styles.progressBarFill,
            {
              width: `${Math.round(progress * 100)}%`,
              backgroundColor: isRouteFinished ? theme.greenAccent : theme.overlayActive,
            },
          ]}
        />
      </View>
      <ThemedText style={styles.progressLabel}>
        {isRouteFinished ? 'Ruta completada' : `${cursor} de ${totalCount} contenedores`}
      </ThemedText>
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
  progressBarBg: {
    height: 10,
    borderRadius: 5,
    backgroundColor: '#ddd',
    overflow: 'hidden',
  },
  progressBarFill: {
    height: '100%',
    borderRadius: 5,
  },
  progressLabel: { fontSize: 13, textAlign: 'right' },
})
