import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { StyleSheet } from 'react-native'

interface IAvatarProps {
  firstName?: string
  lastName?: string
}

export const Avatar = ({ firstName, lastName }: IAvatarProps) => {
  const theme = useTheme()

  const initials = `${firstName} ${lastName}`
    .split(' ')
    .map(word => word[0])
    .join('')
    .toUpperCase()
    .slice(0, 2)

  return (
    <ThemedView
      style={[styles.avatar, { backgroundColor: theme.greenBackground }]}
    >
      <ThemedText style={[styles.avatarText, { color: theme.greenAccent }]}>
        {initials}
      </ThemedText>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  avatar: {
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  avatarText: { fontWeight: 'bold' },
})
