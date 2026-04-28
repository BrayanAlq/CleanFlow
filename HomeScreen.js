import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
} from "react-native";

const data = [
  { name: "Av. Los Olivos 245", status: "Lleno", percent: "92%" },
  { name: "Jr. Lampa 480", status: "Disponible", percent: "64%" },
  { name: "Av. Benavides 1820", status: "Disponible", percent: "28%" },
];

export default function HomeScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll}>

        <Text style={styles.title}>Hola, vecino</Text>
        <Text style={styles.subtitle}>Tu zona en tiempo real</Text>

        <View style={styles.cardGreen}>
          <Text style={styles.greenTitle}>Camión en camino</Text>
          <Text style={styles.bold}>A 5 minutos de tu zona</Text>
          <Text>Camión #12 · Zona Norte</Text>

          <Text style={styles.action}>¡Saca tus bolsas! 🌱</Text>

          <View style={styles.rowBetween}>
            <Text>⏰ Estimado: 10:30 AM</Text>
            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>Recordarme</Text>
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

        <Text style={styles.section}>Tachos cerca de ti</Text>

        {data.map((item, index) => (
          <View key={index} style={styles.listItem}>
            <View>
              <Text style={styles.bold}>{item.name}</Text>
              <Text>{item.status}</Text>
            </View>

            <View style={styles.badge}>
              <Text>{item.percent}</Text>
            </View>
          </View>
        ))}

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
    backgroundColor: "#DFF5E1",
    padding: 16,
    borderRadius: 16,
    marginBottom: 16,
  },
  greenTitle: { color: "#2e7d32" },
  bold: { fontWeight: "bold" },
  action: { marginVertical: 8 },
  row: { flexDirection: "row", gap: 10, marginBottom: 16 },
  rowBetween: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  cardSmall: {
    flex: 1,
    backgroundColor: "#FFF",
    padding: 16,
    borderRadius: 12,
  },
  link: { color: "#2e7d32" },
  section: { fontSize: 16, fontWeight: "bold", marginBottom: 10 },
  listItem: {
    backgroundColor: "#FFF",
    padding: 16,
    borderRadius: 12,
    marginBottom: 10,
    flexDirection: "row",
    justifyContent: "space-between",
  },
  badge: {
    backgroundColor: "#EAEAEA",
    padding: 10,
    borderRadius: 20,
  },
  button: {
    backgroundColor: "#111",
    padding: 10,
    borderRadius: 20,
  },
  buttonText: { color: "#FFF" },
});