import * as ImagePicker from 'expo-image-picker'

export const useImagePicker = (onPick: (uris: string[]) => void) => {
  const openGallery = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync()
    if (status !== 'granted') return

    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ['images'],
      allowsMultipleSelection: true,
      quality: 1,
    })

    if (!result.canceled) {
      onPick(result.assets.map(a => a.uri))
    }
  }

  return { openGallery }
}
