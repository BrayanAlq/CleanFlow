import { useDriverTripContext } from '@/context/driver-trip-context'
import { useTheme } from '@/hooks/use-theme'
import { formatTime } from '@/utils/time-formatter'
import { Pressable, StyleSheet } from 'react-native'
import { ThemedText } from '../themed-text'

export const MainButton = () => {
  const theme = useTheme()

  const { startRoute, finishRoute, timer, status, isLoading } = useDriverTripContext()

  const handlePress = () => {
    if (status === 'initial') {
      startRoute()
    } else if (status === 'active') {
      finishRoute()
    }
  }

  const buttonText = isLoading
    ? 'Cargando...'
    : status === 'initial'
      ? 'Comenzar'
      : status === 'active'
        ? `${formatTime(timer)} | Terminar`
        : 'Finalizando...'

  return (
    <Pressable
      onPress={handlePress}
      disabled={status === 'finishing' || isLoading}
      style={[styles.container, { backgroundColor: theme?.greenAccent }]}
    >
      <ThemedText style={styles.text}>{buttonText}</ThemedText>
    </Pressable>
  )
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
    elevation: 1,
    borderRadius: 16,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 24,
  },
})
