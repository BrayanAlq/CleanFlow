import { NearContainer } from '@/components/home/near-container'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useAuthContext } from '@/context/auth-context'
import { useNearContainers } from '@/hooks/use-container'
import { useRemaining } from '@/hooks/use-resident'
import { useTheme } from '@/hooks/use-theme'
import { FlatList, StyleSheet } from 'react-native'

export default function ResidentHome() {
  const theme = useTheme()
  const { user } = useAuthContext()
  const { data: remaining } = useRemaining()
  const { data: page, fetchNextPage, hasNextPage, isFetchingNextPage } = useNearContainers()

  const flatNearContainers = page?.pages.flatMap(page => page.content) ?? []

  const handleEndReached = () => {
    if (hasNextPage && !isFetchingNextPage) {
      fetchNextPage()
    }
  }

  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <ThemedView style={styles.elevatedWrapper}>
        <ThemedText style={styles.welcomeText}>
          Hola!
          <ThemedText style={[styles.welcomeText, styles.name]}>{' ' + user?.first_name}</ThemedText>
        </ThemedText>
      </ThemedView>
      <ThemedText style={styles.titleText}>Contenedores cercanos</ThemedText>
      <ThemedView style={[styles.elevatedWrapper, styles.containerWrapper, { backgroundColor: theme.background }]}>
        <FlatList
          data={flatNearContainers}
          showsVerticalScrollIndicator={false}
          keyExtractor={item => `${item.id}`}
          renderItem={({ item }) => (
            <NearContainer
              id={item.id}
              name={item.name}
              image={item.url}
              lastMetric={item.last_metric}
              distance={item.distance}
            />
          )}
          onEndReached={handleEndReached}
        />
      </ThemedView>
      <ThemedText style={styles.titleText}>Logros</ThemedText>
      <ThemedView style={styles.elevatedWrapper}>
        <ThemedText>Estás a {remaining?.remaining} reportes de tu próxima insignia</ThemedText>
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16, display: 'flex', flexDirection: 'column', gap: 16 },
  elevatedWrapper: {
    width: 'auto',
    padding: 16,
    borderRadius: 16,
    elevation: 1,
  },
  welcomeText: {
    fontSize: 26,
  },
  name: { fontWeight: 'bold' },
  titleText: {
    fontSize: 22,
    fontWeight: 'semibold',
  },
  containerWrapper: {
    flex: 1,
  },
})
