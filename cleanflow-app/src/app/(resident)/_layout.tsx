import { ThemedText } from '@/components/themed-text'
import { useAuthContext } from '@/context/auth-context'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import * as Location from 'expo-location'
import * as Notifications from 'expo-notifications'
import { Tabs } from 'expo-router'
import { useEffect } from 'react'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function ResidentLayout() {
  const theme = useTheme()
  const { user } = useAuthContext()

  useEffect(() => {
    if (user?.role !== 'RESIDENT') return

    const requestPermissions = async () => {
      const { status: notifStat } = await Notifications.getPermissionsAsync()
      if (notifStat !== 'granted') {
        const { status } = await Notifications.requestPermissionsAsync()
        if (status !== 'granted') {
          console.log('❌ Permiso de notificaciones denegado')
        }
      }

      const { status: locationForegroundStatue } = await Location.getBackgroundPermissionsAsync()
      if (locationForegroundStatue !== 'granted') {
        const { status } = await Location.requestForegroundPermissionsAsync()
        if (status !== 'granted') {
          console.log('❌ Permiso de ubicación foreground denegado')
        }
      }
    }
  }, [user?.role])

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Tabs
        screenOptions={{
          headerShown: false,
          tabBarStyle: {
            backgroundColor: theme.backgroundElement,
            elevation: 0,
            shadowOpacity: 0,
            borderTopWidth: 1,
            borderTopColor: theme.borderTabColor,
          },
        }}
      >
        <Tabs.Screen
          name="home"
          options={{
            tabBarIcon: ({ size, focused }) =>
              focused ? (
                <Ionicons name="home" size={20} color={theme.greenAccent} />
              ) : (
                <Ionicons name="home-outline" size={20} color={theme.textSecondary} />
              ),
            tabBarLabel: ({ focused }) => (
              <ThemedText style={{ fontSize: 12 }} themeColor={focused ? 'greenAccent' : 'textSecondary'}>
                Inicio
              </ThemedText>
            ),
          }}
        />
        <Tabs.Screen
          name="explore"
          options={{
            tabBarIcon: ({ size, focused }) =>
              focused ? (
                <Ionicons name="map" size={20} color={theme.greenAccent} />
              ) : (
                <Ionicons name="map-outline" size={20} color={theme.textSecondary} />
              ),
            tabBarLabel: ({ focused }) => (
              <ThemedText style={{ fontSize: 12 }} themeColor={focused ? 'greenAccent' : 'textSecondary'}>
                Explora
              </ThemedText>
            ),
          }}
        />
        <Tabs.Screen
          name="profile"
          options={{
            tabBarIcon: ({ size, focused }) =>
              focused ? (
                <Ionicons name="person" size={20} color={theme.greenAccent} />
              ) : (
                <Ionicons name="person-outline" size={20} color={theme.textSecondary} />
              ),
            tabBarLabel: ({ focused }) => (
              <ThemedText style={{ fontSize: 12 }} themeColor={focused ? 'greenAccent' : 'textSecondary'}>
                Mi perfil
              </ThemedText>
            ),
          }}
        />
      </Tabs>
    </SafeAreaView>
  )
}
