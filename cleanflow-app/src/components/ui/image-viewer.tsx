import { useEffect, useRef } from 'react'
import { Animated, Dimensions, Modal, Pressable, StyleSheet } from 'react-native'
import { ThemedText } from '../themed-text'

const { width, height } = Dimensions.get('window')

interface IImageViewerProps {
  uri: string | null
  onClose: () => void
}

export const ImageViewer = ({ uri, onClose }: IImageViewerProps) => {
  const scaleAnim = useRef(new Animated.Value(0.3)).current
  const opacityAnim = useRef(new Animated.Value(0)).current

  const visible = uri !== null

  useEffect(() => {
    if (visible) {
      scaleAnim.setValue(0.3)
      opacityAnim.setValue(0)
      Animated.parallel([
        Animated.spring(scaleAnim, {
          toValue: 1,
          useNativeDriver: true,
          damping: 18,
          stiffness: 220,
        }),
        Animated.timing(opacityAnim, {
          toValue: 1,
          duration: 180,
          useNativeDriver: true,
        }),
      ]).start()
    }
  }, [visible])

  const handleClose = () => {
    Animated.parallel([
      Animated.timing(scaleAnim, {
        toValue: 0.3,
        duration: 160,
        useNativeDriver: true,
      }),
      Animated.timing(opacityAnim, {
        toValue: 0,
        duration: 160,
        useNativeDriver: true,
      }),
    ]).start(onClose)
  }

  return (
    <Modal visible={visible} transparent animationType="none" onRequestClose={handleClose}>
      <Animated.View style={[styles.backdrop, { opacity: opacityAnim }]}>
        <Pressable style={StyleSheet.absoluteFill} onPress={handleClose} />
        <Animated.Image
          source={{ uri: uri ?? '' }}
          style={[styles.image, { transform: [{ scale: scaleAnim }] }]}
          resizeMode="contain"
        />
        <Pressable style={styles.closeButton} onPress={handleClose}>
          <ThemedText style={styles.closeText}>✕</ThemedText>
        </Pressable>
      </Animated.View>
    </Modal>
  )
}

const styles = StyleSheet.create({
  backdrop: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.88)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  image: {
    width: width * 0.92,
    height: height * 0.65,
  },
  closeButton: {
    position: 'absolute',
    top: 52,
    right: 20,
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: 'rgba(255,255,255,0.15)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  closeText: {
    color: '#fff',
    fontSize: 16,
  },
})
