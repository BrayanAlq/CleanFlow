import { ThemedView } from '@/components/themed-view'
import { Avatar } from '@/components/ui/avatar'
import { useAuthContext } from '@/context/auth-context'
import { useStompContext } from '@/context/stomp-context'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { BottomSheetTextInput } from '@gorhom/bottom-sheet'
import { useEffect, useState } from 'react'
import { Keyboard, Pressable, StyleSheet } from 'react-native'
import { useSafeAreaInsets } from 'react-native-safe-area-context'

export interface SubmitProps {
  containerId: number
}

export const Submit = ({ containerId }: SubmitProps) => {
  const [text, setText] = useState('')

  const theme = useTheme()
  const { user } = useAuthContext()
  const { bottom: bottomSafeArea } = useSafeAreaInsets()
  const { publish, connected } = useStompContext()

  const [insetBottom, setInsetBottom] = useState(bottomSafeArea)
  const [isKeyboardOpen, setIsKeyboardOpen] = useState(false)

  const handleSubmit = () => {
    if (!connected || !text.trim()) return
    const report = { container_id: containerId, content: text.trim(), image_ids: [] }
    publish('/app/reports.create', report)
    setText('')
  }

  useEffect(() => {
    const showSub = Keyboard.addListener('keyboardDidShow', () => {
      setInsetBottom(0)
      setIsKeyboardOpen(true)
    })

    const hideSub = Keyboard.addListener('keyboardDidHide', () => {
      setInsetBottom(0)
      setIsKeyboardOpen(false)
    })

    return () => {
      showSub.remove()
      hideSub.remove()
    }
  }, [bottomSafeArea])

  return (
    <ThemedView
      style={{
        ...styles.messageBoxContainer,
        backgroundColor: theme.background,
        borderColor: theme.textSecondary,
      }}
    >
      <ThemedView style={styles.avatarContainer}>
        <Avatar firstName={user?.first_name} lastName={user?.last_name}></Avatar>
      </ThemedView>
      <BottomSheetTextInput
        value={text}
        onChangeText={text => {
          setText(text)
        }}
        style={styles.textInput}
      />
      <ThemedView style={[styles.iconSendContainer, { backgroundColor: theme.greenBackground }]}>
        <Pressable onPress={handleSubmit}>
          <Ionicons name="send-outline" size={20} color="#2e7d32" />
        </Pressable>
      </ThemedView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  messageBoxContainer: {
    padding: 16,
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    gap: 12,
    borderTopWidth: 1,
  },
  avatarContainer: {
    width: 40,
    height: 40,
    borderRadius: '100%',
    overflow: 'hidden',
  },
  iconSendContainer: {
    width: 40,
    height: 40,
    borderRadius: '100%',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  },
  textInput: {
    flex: 1,
    padding: 10,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#000',
  },
})
