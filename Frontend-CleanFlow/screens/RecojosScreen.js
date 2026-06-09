import { useState, useEffect, useCallback } from "react";
import {
  View, Text, StyleSheet, ScrollView, TouchableOpacity,
  Linking, ActivityIndicator, RefreshControl,
} from "react-native";
import api from "../services/api";
import { getColor } from "../data/mock";

export default function RecojosScreen() {
  const [containers, setContainers] = useState([]);
  const [collected, setCollected] = useState({});
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [error, setError] = useState("");

  const fetchRoute = useCallback(async (isRefresh = false) => {
    if (isRefresh) setRefreshing(true);
    else setLoading(true);
    setError("");

    try {
      const res = await api.get("/driver/scheduled-route");
      if (res.data && res.data.containers) {
        const bins = res.data.containers.map((c) => ({
          id: c.container_id,
          name: c.name,
          address_name: c.address_name,
          latitude: c.latitude,
          longitude: c.longitude,
          filling_level: c.filling_level ?? 0,
        }));
        setContainers(bins);
      } else {
        setContainers([]);
      }
    } catch (e) {
      console.error("Error al cargar ruta:", e?.response?.data || e.message);
      setError("No se pudieron cargar los contenedores. Verifica tu conexión.");
    }
    setLoading(false);
    setRefreshing(false);
  }, []);

  useEffect(() => {
    fetchRoute();
  }, [fetchRoute]);

  const toggleCollected = (id) => {
    setCollected((prev) => ({ ...prev, [id]: !prev[id] }));
  };

  const total = containers.length;
  const collectedCount = Object.values(collected).filter(Boolean).length;
  const progress = total > 0 ? Math.round((collectedCount / total) * 100) : 0;

  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=driving`;
    Linking.openURL(url).catch(() => alert("No se pudo abrir el mapa"));
  };

  if (loading) {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <ActivityIndicator size="large" color="#2e7d32" />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <ScrollView
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={() => fetchRoute(true)} />
        }
      >
        <Text style={styles.title}>Recolección</Text>

        {error ? (
          <View style={styles.errorCard}>
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity style={styles.retryButton} onPress={() => fetchRoute()}>
              <Text style={styles.retryText}>Reintentar</Text>
            </TouchableOpacity>
          </View>
        ) : total === 0 ? (
          <View style={styles.emptyCard}>
            <Text style={styles.emptyTitle}>Sin contenedores asignados</Text>
            <Text style={styles.emptySub}>
              No tienes contenedores asignados para hoy. Solicita al administrador que te asigne una ruta.
            </Text>
          </View>
        ) : (
          <>
            <View style={styles.progressCard}>
              <Text style={styles.progressNumber}>{collectedCount}/{total}</Text>
              <Text style={styles.progressLabel}>tachos recolectados</Text>
              <View style={styles.barBg}>
                <View style={[styles.barFill, { width: `${progress}%` }]} />
              </View>
              <Text style={styles.progressPercent}>{progress}% completado</Text>
            </View>

            {containers.map((item) => {
              const isCollected = collected[item.id];
              const fillPercent = item.filling_level ?? 0;
              return (
                <View key={item.id} style={styles.card}>
                  <TouchableOpacity
                    style={styles.cardLeft}
                    onPress={() => openDirections(item.latitude, item.longitude)}
                  >
                    <Text style={styles.bold}>{item.name}</Text>
                    <Text style={styles.gray}>
                      {item.address_name || ""} · {fillPercent}% lleno
                    </Text>
                    <Text
                      style={{
                        color: isCollected ? "#999" : getColor(fillPercent),
                        fontWeight: "600",
                      }}
                    >
                      {isCollected ? "Recolectado" : "Pendiente"}
                    </Text>
                  </TouchableOpacity>

                  <TouchableOpacity
                    style={[
                      styles.actionButton,
                      { backgroundColor: isCollected ? "#e0e0e0" : "#2e7d32" },
                    ]}
                    onPress={() => toggleCollected(item.id)}
                  >
                    <Text style={styles.actionText}>
                      {isCollected ? "✓" : "Recolectar"}
                    </Text>
                  </TouchableOpacity>
                </View>
              );
            })}
          </>
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5" },
  title: { fontSize: 22, fontWeight: "bold", margin: 16, marginBottom: 0 },
  errorCard: {
    margin: 16, backgroundColor: "#ffebee", padding: 20,
    borderRadius: 20, alignItems: "center",
  },
  errorText: { color: "#c62828", textAlign: "center", marginBottom: 12 },
  retryButton: {
    backgroundColor: "#2e7d32", paddingHorizontal: 24, paddingVertical: 10,
    borderRadius: 20,
  },
  retryText: { color: "#fff", fontWeight: "bold" },
  emptyCard: {
    margin: 16, backgroundColor: "#fff", padding: 32,
    borderRadius: 20, alignItems: "center",
  },
  emptyTitle: { fontSize: 18, fontWeight: "bold", color: "#555", marginBottom: 8 },
  emptySub: { color: "#999", textAlign: "center", lineHeight: 20 },
  progressCard: {
    margin: 16, backgroundColor: "#fff", padding: 20,
    borderRadius: 20, alignItems: "center",
  },
  progressNumber: { fontSize: 36, fontWeight: "bold", color: "#2e7d32" },
  progressLabel: { color: "#777", marginBottom: 12 },
  barBg: {
    width: "100%", height: 10, backgroundColor: "#e0e0e0",
    borderRadius: 10, overflow: "hidden",
  },
  barFill: { height: "100%", backgroundColor: "#2e7d32", borderRadius: 10 },
  progressPercent: { marginTop: 8, color: "#666", fontWeight: "600" },
  card: {
    backgroundColor: "#fff", marginHorizontal: 16, marginBottom: 10,
    padding: 16, borderRadius: 16, flexDirection: "row", alignItems: "center",
  },
  cardLeft: { flex: 1 },
  bold: { fontWeight: "bold" },
  gray: { color: "#777", marginVertical: 2 },
  actionButton: {
    paddingHorizontal: 20, paddingVertical: 12, borderRadius: 20,
  },
  actionText: { color: "#fff", fontWeight: "bold" },
});
