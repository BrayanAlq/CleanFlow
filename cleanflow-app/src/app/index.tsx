import { useAuthContext } from '@/context/auth-context'
import { Redirect } from 'expo-router'

export default function Index() {
  const { isLoggedIn, user } = useAuthContext()

  if (!isLoggedIn) {
    return <Redirect href='/(auth)/login' />
  }

  if (user?.role === 'RESIDENT') {
    return <Redirect href='/(resident)/profile' />
  }

  return <Redirect href='/(driver)/profile' />
}
