import { GoalContainer } from '@/components/goals/goal-container'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useAuthContext } from '@/context/auth-context'
import { useTheme } from '@/hooks/use-theme'
import { ScrollView, StyleSheet } from 'react-native'

export default function ResidentHome() {
  const theme = useTheme()
  const { user } = useAuthContext()
  return (
    <ThemedView type="backgroundElement" style={styles.container}>
      <ThemedView style={styles.elevatedWrapper}>
        <ThemedText style={styles.welcomeText}>
          Bienvenido
          <ThemedText style={[styles.welcomeText, styles.name]}>{' ' + user?.first_name}</ThemedText>
        </ThemedText>
      </ThemedView>
      <ThemedText style={styles.titleText}>Contenedores cercanos</ThemedText>
      <ThemedView type="backgroundElement">
        <ScrollView
          showsVerticalScrollIndicator={false}
          style={[styles.elevatedWrapper, styles.containerWrapper, { backgroundColor: theme.background }]}
        >
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={1} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={2} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={3} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={4} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={5} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={6} />
          <GoalContainer id={1} name="Contenedor 1" image="https://picsum.photos/id/10/200/300" visitOrder={7} />
        </ScrollView>
      </ThemedView>
      <ThemedText style={styles.titleText}>Logros</ThemedText>
      <ThemedView style={styles.elevatedWrapper}>
        <ThemedText>Estás a x reportes de tu próxima insignia</ThemedText>
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16, display: 'flex', flexDirection: 'column', gap: 16 },
  elevatedWrapper: {
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
    height: 450,
  },
})
