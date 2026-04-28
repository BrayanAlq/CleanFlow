import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import { Ionicons } from "@expo/vector-icons";
import { View, Text, StyleSheet } from "react-native";

import HomeScreen from "./screens/HomeScreen";
import CercanosScreen from "./screens/CercanosScreen";
import ReportarScreen from "./screens/ReportarScreen";
import PerfilScreen from "./screens/PerfilScreen";

const Tab = createBottomTabNavigator();

const Screen = (name) => () => (
  <View style={styles.center}>
    <Text style={styles.text}>{name}</Text>
  </View>
);

export default function App() {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={{ flex: 1 }}>
        <NavigationContainer>
          <Tab.Navigator
            screenOptions={({ route }) => ({
              headerShown: false,
              tabBarActiveTintColor: "#2e7d32",
              tabBarInactiveTintColor: "#777",
              tabBarStyle: styles.tabBar,
              tabBarLabelStyle: styles.tabLabel,
              tabBarIcon: ({ color, size, focused }) => {
                const icons = {
                  Inicio: focused ? "home" : "home-outline",
                  Cercanos: focused ? "map" : "map-outline",
                  Reportar: focused
                    ? "paper-plane"
                    : "paper-plane-outline",
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
            <Tab.Screen name="Perfil" component={PerfilScreen} />
          </Tab.Navigator>
        </NavigationContainer>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  tabBar: {
    height: 70,
    paddingBottom: 10,
    borderTopWidth: 0,
    elevation: 10,
    backgroundColor: "#fff",
  },
  tabLabel: {
    fontSize: 12,
  },
  center: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  text: {
    fontSize: 18,
  },
});