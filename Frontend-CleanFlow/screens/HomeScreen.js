import { useEffect, useState, useContext } from "react";
import {
  View, Text, StyleSheet, ScrollView, TouchableOpacity,
} from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { AuthContext } from "../context/AuthContext";
import api from "../services/api";

const FALLBACK_BINS = [
  { name: "Av. Los Olivos 245", status: "Lleno", percent: "92%" },
  { name: "Jr. Lampa 480", status: "Disponible", percent: "64%" },
  { name: "Av. Benavides 1820", status: "Disponible", percent: "28%" },
];

const FALLBACK_DRIVER = {
  name: "Camión #12", zone: "Norte", minutes: "5", time: "10:30 AM",
};

function binsToUI(container) {
  const lvl = container.last_metric?.filling_level ?? 0;
  return {
    name: container.name || container.address_name || "",
    status: lvl >= 0.85 ? "Lleno" : "Disponible",
    percent: Math.round(lvl * 100) + "%",
  };
}

export default function HomeScreen({ navigation }) {
  const { user } = useContext(AuthContext);
  const [bins, setBins] = useState(FALLBACK_BINS);
  const [driverInfo] = useState(FALLBACK_DRIVER);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const res = await api.get("/container/viewport", {
          params: {
            north: -12.07, south: -12.095,
            west: -77.03, east: -77.01,
          },
        });
        if (!cancelled && Array.isArray(res.data) && res.data.length > 0) {
          setBins(res.data.slice(0, 5).map(binsToUI));
        }
      } catch {}
    })();
    return () => { cancelled = true; };
  }, []);

  const firstName = user?.firstName || "Vecino";

  return (
    <View style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={styles.title}>Hola, {firstName}</Text>
        <Text style={styles.subtitle}>Tu zona en tiempo real</Text>

        <View style={styles.cardGreen}>
          <Text style={styles.greenTitle}>Camión en camino</Text>
          <Text style={styles.bold}>
            A {driverInfo.minutes} minutos de tu zona
          </Text>
          <Text>
            {driverInfo.name} · Zona {driverInfo.zone}
          </Text>

          <Text style={styles.action}>¡Saca tus bolsas!</Text>

          <View style={styles.rowBetween}>
            <Text><Ionicons name="time-outline" size={18} /> Estimado: {driverInfo.time}</Text>
            <TouchableOpacity style={styles.button} activeOpacity={0.7}>
              <Text style={styles.buttonText}>Recordarme</Text>
            </TouchableOpacity>
          </View>
        </View>

        <View style={styles.row}>
          <TouchableOpacity
            style={styles.cardSmall}
            activeOpacity={0.7}
            onPress={() => navigation.navigate("Cercanos")}
          >
            <Text><Ionicons name="location-outline" size={16} /> Tachos cerca</Text>
            <Text style={styles.link}>Ver mapa</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.cardSmall}
            activeOpacity={0.7}
            onPress={() => navigation.navigate("Reportar")}
          >
            <Text><Ionicons name="notifications-outline" size={16} /> Reportar</Text>
            <Text style={styles.link}>Olor o basura</Text>
          </TouchableOpacity>
        </View>

        <Text style={styles.section}>Tachos cerca de ti</Text>

        {bins.map((item, index) => (
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
    backgroundColor: "#DFF5E1", padding: 16, borderRadius: 16,
    marginBottom: 16, elevation: 2,
    shadowColor: "#000", shadowOpacity: 0.06, shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
  },
  greenTitle: { color: "#2e7d32" },
  bold: { fontWeight: "bold" },
  action: { marginVertical: 8 },
  row: { flexDirection: "row", gap: 10, marginBottom: 16 },
  rowBetween: {
    flexDirection: "row", justifyContent: "space-between",
    alignItems: "center",
  },
  cardSmall: {
    flex: 1, backgroundColor: "#FFF", padding: 16, borderRadius: 12,
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.05,
    shadowRadius: 4, shadowOffset: { width: 0, height: 1 },
  },
  link: { color: "#2e7d32" },
  section: { fontSize: 16, fontWeight: "bold", marginBottom: 10 },
  listItem: {
    backgroundColor: "#FFF", padding: 16, borderRadius: 12,
    marginBottom: 10, flexDirection: "row",
    justifyContent: "space-between",
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 3, shadowOffset: { width: 0, height: 1 },
  },
  badge: {
    backgroundColor: "#EAEAEA", padding: 10, borderRadius: 20,
  },
  button: {
    backgroundColor: "#111", padding: 10, borderRadius: 20,
  },
  buttonText: { color: "#FFF" },
});
