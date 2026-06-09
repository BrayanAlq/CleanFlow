import { AuthProvider } from '@/context/auth-context'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { DarkTheme, DefaultTheme, Stack, ThemeProvider } from 'expo-router'
import { StatusBar, useColorScheme } from 'react-native'
import { GestureHandlerRootView } from 'react-native-gesture-handler'
import { SafeAreaProvider } from 'react-native-safe-area-context'
import { Toaster } from 'sonner-native'

const queryClient = new QueryClient()

export default function TabLayout() {
  const colorScheme = useColorScheme()

  return (
    <GestureHandlerRootView>
      <StatusBar
        barStyle={colorScheme === 'dark' ? 'light-content' : 'dark-content'}
      />
      <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
        <AuthProvider>
          <QueryClientProvider client={queryClient}>
            <SafeAreaProvider>
              <Stack screenOptions={{ headerShown: false }}>
                <Stack.Screen name='(auth)' />
                <Stack.Screen name='(driver)' />
                <Stack.Screen name='(resident)' />
              </Stack>
              <Toaster />
            </SafeAreaProvider>
          </QueryClientProvider>
        </AuthProvider>
      </ThemeProvider>
    </GestureHandlerRootView>
  )
}
