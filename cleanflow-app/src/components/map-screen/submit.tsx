import { ThemedView } from '@/components/themed-view'
import { Avatar } from '@/components/ui/avatar'
import { useAuthContext } from '@/context/auth-context'
import { useStompContext } from '@/context/stomp-context'
import { useImagePicker } from '@/hooks/use-gallery'
import { useSaveImage } from '@/hooks/use-reports'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons, MaterialIcons } from '@expo/vector-icons'
import { BottomSheetTextInput } from '@gorhom/bottom-sheet'
import { useState } from 'react'
import { ActivityIndicator, Pressable, StyleSheet } from 'react-native'

export interface SubmitProps {
  containerId: number
}

export const Submit = ({ containerId }: SubmitProps) => {
  const [text, setText] = useState('')
  const [imageUris, setImageUris] = useState<string[]>([])

  const theme = useTheme()
  const { user } = useAuthContext()
  const { publish, connected } = useStompContext()
  const { imageMutation } = useSaveImage()

  const handleSubmit = async () => {
    if (!connected || !text.trim()) return
    const imageIds: number[] = []

    if (imageUris.length > 0) {
      const responde = await imageMutation.mutateAsync(imageUris)
      imageIds.push(...responde.map(i => i.id))
    }

    const report = { container_id: containerId, content: text.trim(), image_ids: imageIds }
    publish('/app/reports.create', report)
    setText('')
  }

  const handleImage = async (uris: string[]) => {
    setImageUris(uris)
  }

  const { openGallery } = useImagePicker(handleImage)

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
      <Pressable style={styles.cameraButton} onPress={openGallery}>
        <MaterialIcons name="photo-library" size={20} color="#000" />
      </Pressable>
      <ThemedView style={[styles.iconSendContainer, { backgroundColor: theme.greenBackground }]}>
        <Pressable onPress={handleSubmit} disabled={imageMutation.isPending}>
          {imageMutation.isPending ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Ionicons name="send-outline" size={20} color="#2e7d32" />
          )}
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
  cameraButton: {
    position: 'absolute',
    right: 80,
  },
})
