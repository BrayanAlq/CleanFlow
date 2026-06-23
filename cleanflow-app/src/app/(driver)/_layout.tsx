import { ThemedText } from '@/components/themed-text'
import { useAuthContext } from '@/context/auth-context'
import { DriverTripProvider } from '@/context/driver-trip-context'
import { StompProvider } from '@/context/stomp-context'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons, MaterialIcons } from '@expo/vector-icons'
import * as Location from 'expo-location'
import { Tabs } from 'expo-router'
import { useEffect } from 'react'
import { SafeAreaView } from 'react-native-safe-area-context'

export default function DriverLayout() {
  const theme = useTheme()
  const { user } = useAuthContext()

  useEffect(() => {
    if (user?.role !== 'DRIVER') return

    const requestPermissions = async () => {
      try {
        const { status: foreground } = await Location.requestForegroundPermissionsAsync()
        if (foreground !== 'granted') return

        const { status: background } = await Location.requestBackgroundPermissionsAsync()
        console.log('Location permission on background:', background)
      } catch (error) {
        console.error('Error requesting location permissions:', error)
      }
    }

    requestPermissions()
  }, [user?.role])

  return (
    <StompProvider>
      <DriverTripProvider>
        <SafeAreaView style={{ flex: 1 }}>
          <Tabs
            initialRouteName="home"
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
              name="goals"
              options={{
                tabBarIcon: ({ size, focused }) =>
                  focused ? (
                    <MaterialIcons name="check-circle" size={20} color={theme.greenAccent} />
                  ) : (
                    <MaterialIcons name="check-circle-outline" size={20} color={theme.textSecondary} />
                  ),
                tabBarLabel: ({ focused }) => (
                  <ThemedText style={{ fontSize: 12 }} themeColor={focused ? 'greenAccent' : 'textSecondary'}>
                    Objetivos
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
      </DriverTripProvider>
    </StompProvider>
  )
}
