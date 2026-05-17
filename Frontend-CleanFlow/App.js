import { createContext, useState } from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import { Ionicons } from "@expo/vector-icons";

import RoleSelectionScreen from "./screens/RoleSelectionScreen";
import HomeScreen from "./screens/HomeScreen";
import CercanosScreen from "./screens/CercanosScreen";
import ReportarScreen from "./screens/ReportarScreen";
import PerfilCiudadano from "./screens/PerfilCiudadano";
import RutaScreen from "./screens/RutaScreen";
import RecojosScreen from "./screens/RecojosScreen";
import PerfilConductor from "./screens/PerfilConductor";

export const AppContext = createContext({
  role: null,
  setRole: () => {},
});

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

function CitizenTabs() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown: false,
        tabBarActiveTintColor: "#2e7d32",
        tabBarInactiveTintColor: "#777",
        tabBarStyle: {
          height: 70,
          paddingBottom: 10,
          borderTopWidth: 0,
          elevation: 10,
          backgroundColor: "#fff",
        },
        tabBarLabelStyle: { fontSize: 12 },
        tabBarIcon: ({ color, size, focused }) => {
          const icons = {
            Inicio: focused ? "home" : "home-outline",
            Cercanos: focused ? "map" : "map-outline",
            Reportar: focused ? "paper-plane" : "paper-plane-outline",
            Perfil: focused ? "person" : "person-outline",
          };
          return (
            <Ionicons
              name={icons[route.name] || "ellipse-outline"}
              size={size}
              color={color}
            />
          );
        },
      })}
    >
      <Tab.Screen name="Inicio" component={HomeScreen} />
      <Tab.Screen name="Cercanos" component={CercanosScreen} />
      <Tab.Screen name="Reportar" component={ReportarScreen} />
      <Tab.Screen name="Perfil" component={PerfilCiudadano} />
    </Tab.Navigator>
  );
}

function DriverTabs() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown: false,
        tabBarActiveTintColor: "#2e7d32",
        tabBarInactiveTintColor: "#777",
        tabBarStyle: {
          height: 70,
          paddingBottom: 10,
          borderTopWidth: 0,
          elevation: 10,
          backgroundColor: "#fff",
        },
        tabBarLabelStyle: { fontSize: 12 },
        tabBarIcon: ({ color, size, focused }) => {
          const icons = {
            Ruta: focused ? "map" : "map-outline",
            Recojos: focused ? "checkmark-circle" : "checkmark-circle-outline",
            Perfil: focused ? "person" : "person-outline",
          };
          return (
            <Ionicons
              name={icons[route.name] || "ellipse-outline"}
              size={size}
              color={color}
            />
          );
        },
      })}
    >
      <Tab.Screen name="Ruta" component={RutaScreen} />
      <Tab.Screen name="Recojos" component={RecojosScreen} />
      <Tab.Screen name="Perfil" component={PerfilConductor} />
    </Tab.Navigator>
  );
}

export default function App() {
  const [role, setRole] = useState(null);

  return (
    <SafeAreaProvider>
      <SafeAreaView style={{ flex: 1 }}>
        <AppContext.Provider value={{ role, setRole }}>
          <NavigationContainer>
            <Stack.Navigator screenOptions={{ headerShown: false }}>
              {!role && (
                <Stack.Screen
                  name="RoleSelection"
                  component={RoleSelectionScreen}
                />
              )}
              {role === "citizen" && (
                <Stack.Screen name="CitizenTabs" component={CitizenTabs} />
              )}
              {role === "driver" && (
                <Stack.Screen name="DriverTabs" component={DriverTabs} />
              )}
            </Stack.Navigator>
          </NavigationContainer>
        </AppContext.Provider>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}
