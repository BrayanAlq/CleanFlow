import { MapView } from '@/components/register/map-view'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { ThemedPasswordInput } from '@/components/ui/themed-password-input'
import { ThemedTextInput } from '@/components/ui/themed-text-input'
import { DEFAULT_LOCATION } from '@/constants/location'
import { useAuth } from '@/hooks/use-auth'
import { getCurrentLocation } from '@/services/location'
import { Ionicons } from '@expo/vector-icons'
import {
  ViewAnnotation,
  ViewAnnotationEvent,
} from '@maplibre/maplibre-react-native'
import { useRouter } from 'expo-router'
import { useEffect, useState } from 'react'
import {
  NativeSyntheticEvent,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  View,
} from 'react-native'
import { toast } from 'sonner-native'

export default function RegisterResident() {
  const [resident, setResident] = useState({
    username: '',
    password: '',
    email: '',
    first_name: '',
    last_name: '',
    address: '',
  })
  const [location, setLocation] = useState({
    longitude: DEFAULT_LOCATION.longitude,
    latitude: DEFAULT_LOCATION.latitude,
  })
  const [hasRealLocation, setHasRealLocation] = useState(false)
  const [confirmPassword, setConfirmPassword] = useState('')
  const [scrollEnabled, setScrollEnabled] = useState(true)

  const { registerResidentMutation } = useAuth()
  const router = useRouter()

  useEffect(() => {
    const localLocation = async () => {
      const location = await getCurrentLocation()
      if (!location) return
      setLocation({
        longitude: location.coords.longitude,
        latitude: location.coords.latitude,
      })
      setHasRealLocation(true)
    }

    localLocation()
  }, [])

  const handleDragEnd = (e: NativeSyntheticEvent<ViewAnnotationEvent>) => {
    const [lng, lat] = e.nativeEvent.lngLat
    setLocation({ longitude: lng, latitude: lat })
  }

  const handleSuccessRegister = () => {
    toast.success('Registro exitoso')
    router.replace('/')
  }

  const handleErrorRegister = () => {
    toast.error('Error al registrar')
  }

  const handleRegister = async () => {
    if (Object.values(resident).some(value => value.trim() === '')) return
    if (!location.longitude || !location.latitude) return

    if (confirmPassword.trim() !== resident.password.trim()) return

    registerResidentMutation.mutate(
      { ...resident, ...location },
      {
        onSuccess: handleSuccessRegister,
        onError: handleErrorRegister,
      },
    )
  }

  return (
    <ThemedView>
      <ScrollView
        scrollEnabled={scrollEnabled}
        contentContainerStyle={styles.scroll}
      >
        <ThemedText themeColor='text' style={styles.title}>
          Registro vecino
        </ThemedText>
        <ThemedText style={styles.subtitle}>
          Crea tu cuenta de vecino
        </ThemedText>
        <ThemedTextInput
          placeholder='Usuario'
          value={resident.username}
          onChangeValue={text => setResident({ ...resident, username: text })}
          pattern={/^.{6,}$/}
        />
        <ThemedTextInput
          placeholder='Correo electrónico'
          value={resident.email}
          onChangeValue={text => setResident({ ...resident, email: text })}
          keyboardType='email-address'
          pattern={/^[^\s@]+@[^\s@]+\.[^\s@]+$/}
        />
        <ThemedTextInput
          placeholder='Nombres'
          value={resident.first_name}
          onChangeValue={text => setResident({ ...resident, first_name: text })}
        />
        <ThemedTextInput
          placeholder='Apellidos'
          value={resident.last_name}
          onChangeValue={text => setResident({ ...resident, last_name: text })}
        />
        <ThemedTextInput
          placeholder='Dirección'
          value={resident.address}
          onChangeValue={text => setResident({ ...resident, address: text })}
        />
        <ThemedPasswordInput
          placeholder='Contraseña'
          value={resident.password}
          onChangeValue={text => setResident({ ...resident, password: text })}
          pattern={/^.{8,}$/}
          areSameStringPassword={
            confirmPassword.trim() === resident.password.trim()
          }
        />
        <ThemedPasswordInput
          placeholder='Confirmar contraseña'
          value={confirmPassword}
          onChangeValue={text => setConfirmPassword(text)}
          pattern={/^.{8,}$/}
          areSameStringPassword={
            confirmPassword.trim() === resident.password.trim()
          }
        />

        <ThemedText style={styles.label}>
          Selecciona tu ubicación en el mapa
        </ThemedText>
        <ThemedView
          onTouchStart={() => setScrollEnabled(false)}
          onTouchEnd={() => setScrollEnabled(true)}
          style={styles.mapContainer}
        >
          <MapView
            center={[location.longitude, location.latitude]}
            shouldCenter={hasRealLocation}
          >
            <ViewAnnotation
              draggable
              key='marker'
              lngLat={[location.longitude, location.latitude]}
              onDragEnd={handleDragEnd}
            >
              <View
                style={{
                  width: 'auto',
                  height: 'auto',
                  backgroundColor: 'transparent',
                  justifyContent: 'center',
                  alignItems: 'center',
                }}
              >
                <Ionicons name='location-sharp' size={24} color='#2e7d32' />
              </View>
            </ViewAnnotation>
          </MapView>
        </ThemedView>

        <TouchableOpacity
          style={[
            styles.button,
            registerResidentMutation.isPending && styles.buttonDisabled,
          ]}
          onPress={handleRegister}
          disabled={registerResidentMutation.isPending}
        >
          <ThemedText style={styles.buttonText}>
            {registerResidentMutation.isPending
              ? 'Registrando...'
              : 'Registrarse'}
          </ThemedText>
        </TouchableOpacity>

        <TouchableOpacity onPress={() => router.back()}>
          <ThemedText style={styles.link}>Ya tengo cuenta</ThemedText>
        </TouchableOpacity>
      </ScrollView>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#f5f5f5' },
  scroll: { padding: 24, paddingBottom: 40 },
  title: { fontSize: 24, fontWeight: 'bold', marginBottom: 4, lineHeight: 28 },
  subtitle: { color: '#666', marginBottom: 20 },
  label: { fontWeight: 'bold', marginTop: 12, marginBottom: 8 },
  button: {
    backgroundColor: '#2e7d32',
    padding: 16,
    borderRadius: 30,
    alignItems: 'center',
    marginTop: 8,
  },
  buttonDisabled: { opacity: 0.6 },
  buttonText: { color: '#fff', fontWeight: 'bold', fontSize: 16 },
  link: { color: '#2e7d32', textAlign: 'center', marginTop: 16, fontSize: 14 },
  mapContainer: {
    marginBottom: 24,
    width: '100%',
    height: 200,
    borderRadius: 16,
    overflow: 'hidden',
  },
})
