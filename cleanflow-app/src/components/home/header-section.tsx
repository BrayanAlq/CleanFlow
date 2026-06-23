import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { StyleSheet } from 'react-native'

interface IHeaderSectionProps {
  name?: string
  total: number
  routeAge: string
}

export const HeaderSection = ({ name, total, routeAge }: IHeaderSectionProps) => {
  return (
    <ThemedView style={styles.container}>
      <ThemedText style={styles.welcomeText}>
        Hola!
        <ThemedText style={[styles.welcomeText, styles.name]}>{' ' + (name ?? '')}</ThemedText>
      </ThemedText>
      <ThemedText themeColor="textSecondary" style={{ marginTop: 4 }}>
        {total > 0
          ? `${total} contenedor${total !== 1 ? 'es' : ''} en tu ruta`
          : 'Hoy no tienes ruta asignada'}
      </ThemedText>
      {routeAge ? (
        <ThemedText themeColor="textSecondary" style={{ fontSize: 12, marginTop: 2 }}>
          Ruta {routeAge}
        </ThemedText>
      ) : null}
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    width: 'auto',
    padding: 16,
    borderRadius: 16,
    elevation: 1,
  },
  welcomeText: { fontSize: 26 },
  name: { fontWeight: 'bold' },
})
