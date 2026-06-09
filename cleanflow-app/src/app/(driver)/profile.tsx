import { InfoItem } from '@/components/profile/info-item'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { Avatar } from '@/components/ui/avatar'
import { useAuthContext } from '@/context/auth-context'
import { useDriver } from '@/hooks/use-driver'
import { useTheme } from '@/hooks/use-theme'
import { FontAwesome, Ionicons, MaterialCommunityIcons } from '@expo/vector-icons'
import { useRouter } from 'expo-router'
import { useState } from 'react'
import { StyleSheet, TouchableOpacity } from 'react-native'

export default function DriverProfile() {
  const [isLoggingOut, setIsLoggingOut] = useState(false)

  const theme = useTheme()
  const { data } = useDriver()
  const { logout } = useAuthContext()
  const router = useRouter()

  const handleLogout = async () => {
    setIsLoggingOut(true)
    try {
      await logout()
      router.replace('/')
    } catch (error) {
      console.error(error)
    } finally {
      setIsLoggingOut(false)
    }
  }
  return (
    <ThemedView style={styles.container} type="backgroundElement">
      <ThemedView type="backgroundElement" style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Mi perfil</ThemedText>

        <ThemedView style={styles.profileCard}>
          <ThemedView style={styles.avatarContainer}>
            <Avatar firstName={data?.first_name} lastName={data?.last_name} />
          </ThemedView>
          <ThemedView style={{ flex: 1 }}>
            <ThemedText style={styles.name}>{`${data?.first_name} ${data?.last_name}`}</ThemedText>
            <ThemedText themeColor="textSecondary">Conductor</ThemedText>
          </ThemedView>
        </ThemedView>

        <ThemedView style={styles.card}>
          {data?.email && (
            <InfoItem label="Correo" value={data?.email}>
              <Ionicons name="mail-outline" size={20} />
            </InfoItem>
          )}
          {data?.username && (
            <InfoItem label="Usuario" value={data?.username}>
              <FontAwesome name="user-o" size={20} />
            </InfoItem>
          )}
          <InfoItem label="Rol" value="Conductor">
            <MaterialCommunityIcons name="steering" size={20} />
          </InfoItem>
        </ThemedView>
      </ThemedView>

      <TouchableOpacity
        style={{ ...styles.logout, backgroundColor: theme.background }}
        onPress={handleLogout}
        activeOpacity={0.7}
      >
        <ThemedText themeColor="textError">{isLoggingOut ? 'Cerrando sesión...' : 'Cerrar sesión'}</ThemedText>
      </TouchableOpacity>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  title: { fontSize: 22, fontWeight: 'bold', marginBottom: 16 },
  profileCard: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    borderRadius: 16,
    marginBottom: 16,
    elevation: 2,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    gap: 12,
  },
  avatarContainer: {
    width: 50,
    height: 50,
    borderRadius: '100%',
    overflow: 'hidden',
  },
  name: { fontWeight: 'bold' },
  card: {
    borderRadius: 16,
    marginBottom: 16,
    elevation: 1,
    shadowColor: '#000',
    shadowOpacity: 0.04,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 1 },
    overflow: 'hidden',
  },
  logout: {
    padding: 16,
    borderRadius: 16,
    alignItems: 'center',
    elevation: 1,
    shadowColor: '#000',
    shadowOpacity: 0.04,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 1 },
  },
})
