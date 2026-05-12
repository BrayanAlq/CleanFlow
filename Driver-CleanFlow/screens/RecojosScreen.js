import { useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Linking,
} from "react-native";
import { BINS, getColor } from "../data/mock";

export default function RecojosScreen() {
  const [bins, setBins] = useState(
    BINS.map((b) => ({ ...b }))
  );

  const toggleCollected = (id) => {
    setBins((prev) =>
      prev.map((b) => (b.id === id ? { ...b, collected: !b.collected } : b))
    );
  };

  const total = bins.length;
  const collected = bins.filter((b) => b.collected).length;
  const progress = total > 0 ? Math.round((collected / total) * 100) : 0;

  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=driving`;
    Linking.openURL(url).catch(() => alert("No se pudo abrir el mapa"));
  };

  return (
    <View style={styles.container}>
      <ScrollView>
        <Text style={styles.title}>Recolección</Text>

        <View style={styles.progressCard}>
          <Text style={styles.progressNumber}>
            {collected}/{total}
          </Text>
          <Text style={styles.progressLabel}>tachos recolectados</Text>
          <View style={styles.barBg}>
            <View style={[styles.barFill, { width: `${progress}%` }]} />
          </View>
          <Text style={styles.progressPercent}>{progress}% completado</Text>
        </View>

        {bins.map((item) => (
          <View key={item.id} style={styles.card}>
            <TouchableOpacity
              style={styles.cardLeft}
              onPress={() => openDirections(item.latitude, item.longitude)}
            >
              <Text style={styles.bold}>{item.name}</Text>
              <Text style={styles.gray}>
                {item.type} · {item.percent}% lleno
              </Text>
              <Text
                style={{
                  color: item.collected ? "#999" : getColor(item.percent),
                  fontWeight: "600",
                }}
              >
                {item.collected ? "Recolectado" : item.status}
              </Text>
            </TouchableOpacity>

            <TouchableOpacity
              style={[
                styles.actionButton,
                {
                  backgroundColor: item.collected ? "#e0e0e0" : "#2e7d32",
                },
              ]}
              onPress={() => toggleCollected(item.id)}
            >
              <Text style={styles.actionText}>
                {item.collected ? "✓" : "Recolectar"}
              </Text>
            </TouchableOpacity>
          </View>
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5" },
  title: { fontSize: 22, fontWeight: "bold", margin: 16, marginBottom: 0 },
  progressCard: {
    margin: 16,
    backgroundColor: "#fff",
    padding: 20,
    borderRadius: 20,
    alignItems: "center",
  },
  progressNumber: { fontSize: 36, fontWeight: "bold", color: "#2e7d32" },
  progressLabel: { color: "#777", marginBottom: 12 },
  barBg: {
    width: "100%",
    height: 10,
    backgroundColor: "#e0e0e0",
    borderRadius: 10,
    overflow: "hidden",
  },
  barFill: {
    height: "100%",
    backgroundColor: "#2e7d32",
    borderRadius: 10,
  },
  progressPercent: { marginTop: 8, color: "#666", fontWeight: "600" },
  card: {
    backgroundColor: "#fff",
    marginHorizontal: 16,
    marginBottom: 10,
    padding: 16,
    borderRadius: 16,
    flexDirection: "row",
    alignItems: "center",
  },
  cardLeft: { flex: 1 },
  bold: { fontWeight: "bold" },
  gray: { color: "#777", marginVertical: 2 },
  actionButton: {
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 20,
  },
  actionText: { color: "#fff", fontWeight: "bold" },
});
