import { MainButton } from '@/components/home/main-button'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useAuthContext } from '@/context/auth-context'
import { StompProvider } from '@/context/stomp-context'
import { StyleSheet } from 'react-native'

export default function DriverHome() {
  const { user } = useAuthContext()
  return (
    <StompProvider>
      <ThemedView type="backgroundElement" style={styles.container}>
        <ThemedView style={styles.elevatedWrapper}>
          <ThemedText style={styles.welcomeText}>
            Hola!
            <ThemedText style={[styles.welcomeText, styles.name]}>{' ' + user?.first_name}</ThemedText>
          </ThemedText>
        </ThemedView>
        <ThemedView style={{ flex: 1 }}></ThemedView>
        <MainButton />
      </ThemedView>
    </StompProvider>
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
})
