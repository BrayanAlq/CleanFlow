import { useTheme } from '@/hooks/use-theme'
import { ReactNode } from 'react'
import { StyleSheet } from 'react-native'
import { ThemedText } from '../themed-text'
import { ThemedView } from '../themed-view'

interface IInfoItemProps {
  label: string
  value: string
  children?: ReactNode
}

export const InfoItem = ({ label, value, children }: IInfoItemProps) => {
  const theme = useTheme()

  return (
    <ThemedView style={[styles.container, { borderColor: theme.backgroundElement }]}>
      <ThemedView style={styles.labelContainer}>
        <ThemedView style={styles.iconLabelContainer}>{children}</ThemedView>
        <ThemedText>{label}</ThemedText>
      </ThemedView>
      <ThemedText themeColor="textSecondary">{value}</ThemedText>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
    borderBottomWidth: 1,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'flex-start',
  },
  labelContainer: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  iconLabelContainer: {
    width: 24,
    height: '100%',
  },
})
