import { ThemedText } from '@/components/themed-text'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons, MaterialIcons } from '@expo/vector-icons'
import { Tabs } from 'expo-router'
import { BottomTabNavigationOptions } from 'expo-router/build/react-navigation/bottom-tabs'
import { ReactElement } from 'react'
import { SafeAreaView } from 'react-native-safe-area-context'

interface ICreateTabOptionProps {
  theme: ReturnType<typeof useTheme>
  iconNameActive: ReactElement
  iconNameInactive: ReactElement
  label: string
}

const createTabOption = ({
  theme,
  iconNameActive,
  iconNameInactive,
  label,
}: ICreateTabOptionProps): BottomTabNavigationOptions => ({
  tabBarIcon: ({ size, focused }) => (focused ? iconNameActive : iconNameInactive),
  tabBarLabel: ({ focused }) => (
    <ThemedText style={{ fontSize: 12 }} themeColor={focused ? 'greenAccent' : 'textSecondary'}>
      {label}
    </ThemedText>
  ),
})

type IConstructedTabs = Omit<ICreateTabOptionProps, 'theme'> & {
  name: string
}

const tabs: IConstructedTabs[] = [
  {
    label: 'Inicio',
    iconNameActive: <Ionicons name="home" size={20} color="#2e7d32" />,
    iconNameInactive: <Ionicons name="home-outline" size={20} color="#000" />,
    name: 'inicio',
  },
  {
    label: 'Explora',
    iconNameActive: <Ionicons name="map" size={20} color="#2e7d32" />,
    iconNameInactive: <Ionicons name="map-outline" size={20} color="#000" />,
    name: 'explore',
  },
  {
    label: 'Objetivos',
    iconNameActive: <MaterialIcons name="check-circle" size={20} color="#2e7d32" />,
    iconNameInactive: <MaterialIcons name="check-circle-outline" size={20} color="#000" />,
    name: 'goals',
  },
  {
    label: 'Mi perfil',
    iconNameActive: <Ionicons name="person" size={20} color="#2e7d32" />,
    iconNameInactive: <Ionicons name="person-outline" size={20} color="#000" />,
    name: 'profile',
  },
]

export default function DriverLayout() {
  const theme = useTheme()

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
        {tabs.map(({ name, label, iconNameActive, iconNameInactive }) => (
          <Tabs.Screen
            name={name}
            options={createTabOption({
              theme,
              iconNameActive,
              iconNameInactive,
              label,
            })}
          />
        ))}
      </Tabs>
    </SafeAreaView>
  )
}
