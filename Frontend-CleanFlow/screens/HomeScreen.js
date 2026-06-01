import { View, Text, StyleSheet, ScrollView, TouchableOpacity } from "react-native";

export default function HomeScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={styles.title}>Hola, vecino</Text>
        <Text style={styles.subtitle}>Tu zona en tiempo real</Text>

        <View style={styles.cardGreen}>
          <Text style={styles.greenTitle}>Monitoreo activo</Text>
          <Text style={styles.bold}>Conductores cerca de tu zona</Text>
          <Text>Revisa el mapa para ver su ubicación en tiempo real</Text>

          <View style={styles.rowBetween}>
            <Text>⏰ Actualización en vivo</Text>
            <TouchableOpacity
              style={styles.button}
              onPress={() => navigation.navigate("Cercanos")}
            >
              <Text style={styles.buttonText}>Ver mapa</Text>
            </TouchableOpacity>
          </View>
        </View>

        <View style={styles.row}>
          <TouchableOpacity
            style={styles.cardSmall}
            onPress={() => navigation.navigate("Cercanos")}
          >
            <Text>📍 Tachos cerca</Text>
            <Text style={styles.link}>Ver mapa</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.cardSmall}
            onPress={() => navigation.navigate("Reportar")}
          >
            <Text>🔔 Reportar</Text>
            <Text style={styles.link}>Olor o basura</Text>
          </TouchableOpacity>
        </View>

        <Text style={styles.section}>Bienvenido a CleanFlow</Text>
        <Text style={styles.sub}>
          Usa el mapa para ver contenedores cercanos y la ubicación de los
          conductores en tiempo real.
        </Text>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#F7F7F7" },
  scroll: { padding: 16, paddingBottom: 120 },
  title: { fontSize: 24, fontWeight: "bold" },
  subtitle: { color: "#666", marginBottom: 16 },
  cardGreen: {
    backgroundColor: "#DFF5E1", padding: 16, borderRadius: 16, marginBottom: 16,
  },
  greenTitle: { color: "#2e7d32" },
  bold: { fontWeight: "bold" },
  row: { flexDirection: "row", gap: 10, marginBottom: 16 },
  rowBetween: {
    flexDirection: "row", justifyContent: "space-between",
    alignItems: "center", marginTop: 12,
  },
  cardSmall: {
    flex: 1, backgroundColor: "#FFF", padding: 16, borderRadius: 12,
  },
  link: { color: "#2e7d32" },
  section: { fontSize: 16, fontWeight: "bold", marginBottom: 10 },
  sub: { color: "#777", marginBottom: 10 },
  button: { backgroundColor: "#111", padding: 10, borderRadius: 20 },
  buttonText: { color: "#FFF" },
});
