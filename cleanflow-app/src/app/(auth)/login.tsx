import { ThemedText } from '@/components/themed-text'
import { ThemedPasswordInput } from '@/components/ui/themed-password-input'
import { ThemedTextInput } from '@/components/ui/themed-text-input'
import { useAuthContext } from '@/context/auth-context'
import { getErrorMessage } from '@/errors/errors'
import { useAuth } from '@/hooks/use-auth'
import { useTheme } from '@/hooks/use-theme'
import { useRouter } from 'expo-router'
import { useState } from 'react'
import {
  ActivityIndicator,
  KeyboardAvoidingView,
  StyleSheet,
  TouchableOpacity,
  View,
} from 'react-native'

export default function Login() {
  const [userCredential, setUserCredential] = useState({
    username: '',
    password: '',
  })
  const [error, setError] = useState('')

  const { loginMutation } = useAuth()
  const { login: loginContext } = useAuthContext()
  const router = useRouter()
  const theme = useTheme()

  const handleLogin = async () => {
    const { username, password } = userCredential
    if (!username.trim() || !password.trim()) {
      return
    }

    loginMutation.mutate(
      { username, password },
      {
        onSuccess: async data => {
          await loginContext(data.token)
          router.replace('/')
        },
        onError: error => {
          setError(getErrorMessage(error.response?.data?.code))
        },
      },
    )
  }

  return (
    <KeyboardAvoidingView
      style={[
        styles.container,
        {
          backgroundColor: theme.background,
        },
      ]}
    >
      <View style={styles.inner}>
        <ThemedText type='subtitle' style={styles.title}>
          CleanFlow
        </ThemedText>
        <ThemedText style={styles.subtitle}>Inicia sesión</ThemedText>

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        <ThemedTextInput
          placeholder='Usuario'
          value={userCredential.username}
          onChangeValue={text =>
            setUserCredential({ ...userCredential, username: text })
          }
          autoCapitalize='none'
          pattern={/^.{6,}$/}
        />

        <ThemedPasswordInput
          placeholder='Contraseña'
          value={userCredential.password}
          onChangeValue={text =>
            setUserCredential({ ...userCredential, password: text })
          }
          pattern={/^.{8,}$/}
        />

        <TouchableOpacity
          style={[styles.button, loginMutation.isPending && { opacity: 0.6 }]}
          onPress={handleLogin}
          disabled={loginMutation.isPending}
        >
          {loginMutation.isPending ? (
            <ActivityIndicator color='#fff' />
          ) : (
            <ThemedText style={styles.buttonText}>Entrar</ThemedText>
          )}
        </TouchableOpacity>

        <TouchableOpacity onPress={() => router.push('/(auth)/register')}>
          <ThemedText style={styles.link}>Registrarse como vecino</ThemedText>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  )
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  inner: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#2e7d32',
    textAlign: 'center',
  },
  subtitle: {
    textAlign: 'center',
    color: '#666',
    marginBottom: 24,
  },
  error: { color: '#e53935', textAlign: 'center', marginBottom: 12 },
  button: {
    backgroundColor: '#2e7d32',
    padding: 16,
    borderRadius: 30,
    alignItems: 'center',
    marginTop: 8,
  },
  buttonText: { color: '#fff', fontWeight: 'bold', fontSize: 16 },
  link: { textAlign: 'center', color: '#2e7d32', marginTop: 16 },
})
