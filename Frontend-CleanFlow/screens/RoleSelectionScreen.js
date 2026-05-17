import { useContext } from "react";
import { View, Text, TouchableOpacity, StyleSheet } from "react-native";
import { AppContext } from "../App";

export default function RoleSelectionScreen() {
  const { setRole } = useContext(AppContext);

  return (
    <View style={styles.container}>
      <Text style={styles.logo}>🗑️</Text>
      <Text style={styles.title}>CleanFlow</Text>
      <Text style={styles.subtitle}>Gestión de residuos inteligente</Text>

      <TouchableOpacity
        style={[styles.button, styles.citizenButton]}
        onPress={() => setRole("citizen")}
      >
        <Text style={styles.buttonText}>Ingresar como vecino</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.button, styles.driverButton]}
        onPress={() => setRole("driver")}
      >
        <Text style={styles.buttonText}>Ingresar como conductor</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#f5f5f5",
    padding: 32,
  },
  logo: { fontSize: 80, marginBottom: 16 },
  title: {
    fontSize: 32,
    fontWeight: "bold",
    color: "#2e7d32",
    marginBottom: 4,
  },
  subtitle: {
    fontSize: 16,
    color: "#666",
    marginBottom: 48,
    textAlign: "center",
  },
  button: {
    width: "100%",
    padding: 18,
    borderRadius: 30,
    alignItems: "center",
    marginBottom: 16,
  },
  citizenButton: { backgroundColor: "#2e7d32" },
  driverButton: { backgroundColor: "#111" },
  buttonText: { color: "#fff", fontWeight: "bold", fontSize: 16 },
});
