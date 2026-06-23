import '@/tasks/background-location'

const ts = () => {
  const d = new Date()
  const p = (n: number) => n.toString().padStart(2, '0')
  return `[${p(d.getHours())}:${p(d.getMinutes())}:${p(d.getSeconds())}]`
}
const origLog = console.log
const origWarn = console.warn
const origError = console.error
console.log = (...args) => origLog(ts(), ...args)
console.warn = (...args) => origWarn(ts(), ...args)
console.error = (...args) => origError(ts(), ...args)

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
      <StatusBar barStyle={colorScheme === 'dark' ? 'light-content' : 'dark-content'} />
      <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
        <AuthProvider>
          <QueryClientProvider client={queryClient}>
            <SafeAreaProvider>
              <Stack screenOptions={{ headerShown: false }}>
                <Stack.Screen name="(auth)" />
                <Stack.Screen name="(driver)" />
                <Stack.Screen name="(resident)" />
              </Stack>
              <Toaster />
            </SafeAreaProvider>
          </QueryClientProvider>
        </AuthProvider>
      </ThemeProvider>
    </GestureHandlerRootView>
  )
}
