import { ThemedText } from '@/components/themed-text'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { Tabs } from 'expo-router'
import { BottomTabNavigationOptions } from 'expo-router/build/react-navigation/bottom-tabs'
import { SafeAreaView } from 'react-native-safe-area-context'

type IoniconsName = keyof typeof Ionicons.glyphMap

interface ICreateTabOptionProps {
  theme: ReturnType<typeof useTheme>
  iconNameActive: IoniconsName
  iconNameInactive: IoniconsName
  label: string
}

const createTabOption = ({
  theme,
  iconNameActive,
  iconNameInactive,
  label,
}: ICreateTabOptionProps): BottomTabNavigationOptions => ({
  tabBarIcon: ({ size, focused }) => (
    <Ionicons
      name={focused ? iconNameActive : iconNameInactive}
      color={focused ? theme.greenAccent : theme.textSecondary}
      size={size}
    />
  ),
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
    iconNameActive: 'home',
    iconNameInactive: 'home-outline',
    name: 'inicio',
  },
  {
    label: 'Explora',
    iconNameActive: 'map',
    iconNameInactive: 'map-outline',
    name: 'explore',
  },
  {
    label: 'Mi perfil',
    iconNameActive: 'person',
    iconNameInactive: 'person-outline',
    name: 'profile',
  },
]

export default function ResidentLayout() {
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
