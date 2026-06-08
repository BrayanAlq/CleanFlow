import { Stack } from 'expo-router'
import { useColorScheme } from 'react-native'

export default function AuthLayout() {
  const colorScheme = useColorScheme()
  const isDark = colorScheme === 'dark'
  return (
    <Stack>
      <Stack.Screen name='login' options={{ headerShown: false }} />
      <Stack.Screen
        name='register'
        options={{
          title: '',
          headerBackTitleStyle: false,
          headerStyle: { backgroundColor: isDark ? '#000' : '#fff' },
        }}
      />
    </Stack>
  )
}
