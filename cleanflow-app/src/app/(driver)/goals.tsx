import { GoalContainer } from '@/components/goals/goal-container'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useDriverRoute } from '@/hooks/use-route'
import { useTheme } from '@/hooks/use-theme'
import { Dimensions, FlatList, StyleSheet } from 'react-native'
import { useSafeAreaInsets } from 'react-native-safe-area-context'

const { height } = Dimensions.get('window')

export default function Goals() {
  const theme = useTheme()
  const { data } = useDriverRoute()

  const insets = useSafeAreaInsets()

  const contentHeight = height - insets.top - insets.bottom - 32 - 68

  return (
    <ThemedView style={[styles.container, { height: contentHeight }]} type="backgroundElement">
      <ThemedText style={styles.title}>Contenedores objetivos</ThemedText>
      <ThemedView type="backgroundElement" style={styles.containersContainer}>
        <FlatList
          data={data?.containers}
          keyExtractor={item => item.container_id.toString()}
          showsVerticalScrollIndicator={false}
          renderItem={({ item }) => (
            <GoalContainer
              key={item.container_id}
              id={item.container_id}
              name={item.name}
              image={item.image.url}
              visitOrder={item.visit_order + 1}
              lastMetric={item.last_metric}
            />
          )}
          ItemSeparatorComponent={() => <ThemedView style={styles.separator} type="backgroundElement" />}
        />
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  title: { fontSize: 22, fontWeight: 'bold', marginBottom: 16 },
  separator: { height: 1 },
  containersContainer: {
    flex: 1,
    borderRadius: 24,
    overflow: 'hidden',
    elevation: 2,
  },
})
