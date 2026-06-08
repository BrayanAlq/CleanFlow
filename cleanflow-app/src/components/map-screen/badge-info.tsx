import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { ReactNode } from 'react'
import { StyleSheet } from 'react-native'

interface IBadgeInfoProps {
  data: number | string
  children: ReactNode
}

export const BadgeInfo = ({ data, children }: IBadgeInfoProps) => {
  const theme = useTheme()

  return (
    <ThemedView
      style={[styles.container, { borderColor: theme.badgeInfoBorder }]}
    >
      {children}
      <ThemedText>{data}</ThemedText>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    display: 'flex',
    paddingHorizontal: 4,
    flexDirection: 'row',
    gap: 4,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 1,
    borderRadius: 8,
  },
})
