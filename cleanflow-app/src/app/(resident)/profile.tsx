import { InfoItem } from '@/components/profile/info-item'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import { Avatar } from '@/components/ui/avatar'
import { useAuthContext } from '@/context/auth-context'
import { useDeviceToken } from '@/hooks/use-device-token'
import { usePushNotification } from '@/hooks/use-push-notification'
import { useResident } from '@/hooks/use-resident'
import { useTheme } from '@/hooks/use-theme'
import { FontAwesome, Ionicons } from '@expo/vector-icons'
import { useRouter } from 'expo-router'
import { useState } from 'react'
import { StyleSheet, TouchableOpacity } from 'react-native'
import { Switch } from 'react-native-gesture-handler'
import { toast } from 'sonner-native'

export default function ResidentProfile() {
  const [enableNotifications, setEnableNotifications] = useState(false)
  const [isLoggingOut, setIsLoggingOut] = useState(false)

  const theme = useTheme()
  const { data } = useResident()
  const { logout } = useAuthContext()
  const router = useRouter()
  const { token } = usePushNotification()
  const { registerMutation, unregisterMutation } = useDeviceToken()

  const handleNotificationsChange = () => {
    if (!enableNotifications) {
      console.log('registering')
      registerMutation.mutate(token, { onSuccess: () => toast.success('Notificaciones activadas') })
    }
    if (enableNotifications) {
      console.log('unregistering')
      unregisterMutation.mutate(token, { onSuccess: () => toast.success('Notificaciones desactivadas') })
    }
    setEnableNotifications(prev => !prev)
  }

  const handleLogout = async () => {
    setIsLoggingOut(true)
    try {
      await logout()
      router.replace('/')
    } catch (error) {
      console.log(error)
    } finally {
      setIsLoggingOut(false)
    }
  }

  return (
    <ThemedView
      style={[
        styles.container,
        {
          backgroundColor: theme.backgroundElement,
        },
      ]}
    >
      <ThemedView type="backgroundElement" style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Mi perfil</ThemedText>

        <ThemedView style={styles.profileCard}>
          <ThemedView style={styles.avatarContainer}>
            <Avatar firstName={data?.first_name} lastName={data?.last_name} />
          </ThemedView>
          <ThemedView style={{ flex: 1 }}>
            <ThemedText style={styles.name}>{`${data?.first_name} ${data?.last_name}`}</ThemedText>
            <ThemedText themeColor="textSecondary">Vecino</ThemedText>
          </ThemedView>
        </ThemedView>

        <ThemedView style={styles.stats}>
          <ThemedView style={styles.statItem}>
            <ThemedText style={styles.statNumber}>{data?.report_count}</ThemedText>
            <ThemedText themeColor="textSecondary">Reportes</ThemedText>
          </ThemedView>
          <ThemedView style={styles.statItem}>
            <ThemedText style={styles.statNumber}>{data?.badge_count}</ThemedText>
            <ThemedText themeColor="textSecondary">Insignias</ThemedText>
          </ThemedView>
        </ThemedView>

        <ThemedView style={styles.card}>
          {data?.address && (
            <InfoItem label="Dirección" value={data?.address}>
              <Ionicons name="home-outline" size={20} color={theme.textSecondary} />
            </InfoItem>
          )}
          {data?.email && (
            <InfoItem label="Correo" value={data?.email}>
              <Ionicons name="mail-outline" size={20} color={theme.textSecondary} />
            </InfoItem>
          )}
          {data?.username && (
            <InfoItem label="Usuario" value={data?.username}>
              <FontAwesome name="user-o" size={20} color={theme.textSecondary} />
            </InfoItem>
          )}
          <ThemedView
            style={[
              styles.row,
              {
                flexDirection: 'row',
                justifyContent: 'space-between',
                borderBottomWidth: 0,
              },
            ]}
          >
            <ThemedView>
              <ThemedText>
                <Ionicons name="notifications-outline" size={20} /> Notificaciones
              </ThemedText>
              <ThemedText themeColor="textSecondary">Cercanía y alertas</ThemedText>
            </ThemedView>
            <Switch
              value={enableNotifications}
              onValueChange={handleNotificationsChange}
              thumbColor={enableNotifications ? theme.greenAccent : theme.textSecondary}
            />
          </ThemedView>
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
  stats: {
    flexDirection: 'row',
    borderRadius: 16,
    marginBottom: 16,
    overflow: 'hidden',
    elevation: 1,
  },
  statItem: { flex: 1, alignItems: 'center', padding: 16 },
  statNumber: { fontWeight: 'bold', fontSize: 18 },
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
  row: {
    padding: 16,
    borderBottomWidth: 1,
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
