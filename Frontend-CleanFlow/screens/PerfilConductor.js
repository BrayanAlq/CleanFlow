import { useContext, useState, useEffect } from "react";
import { View, Text, StyleSheet, TouchableOpacity, ActivityIndicator } from "react-native";
import { AuthContext } from "../context/AuthContext";
import api from "../services/api";

export default function PerfilConductor() {
  const { user, logout } = useContext(AuthContext);
  const [profile, setProfile] = useState(null);
  const [scheduledRoute, setScheduledRoute] = useState(null);

  useEffect(() => {
    (async () => {
      try {
        const [profileRes, routeRes] = await Promise.all([
          api.get("/driver"),
          api.get("/driver/scheduled-route").catch(() => null),
        ]);
        setProfile(profileRes.data);
        if (routeRes?.data) setScheduledRoute(routeRes.data);
      } catch (e) {}
    })();
  }, []);

  const info = profile || user;
  const name = info
    ? `${info.first_name || info.firstName || ""} ${info.last_name || info.lastName || ""}`
    : "Conductor";
  const initials = name
    .split(" ")
    .map((s) => s[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);

  const containerCount = scheduledRoute?.containers?.length || 0;

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi perfil</Text>

      <View style={styles.profileCard}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>{initials}</Text>
        </View>
        <View style={{ flex: 1 }}>
          <Text style={styles.name}>{name}</Text>
          <Text style={styles.sub}>Conductor · {info?.username || ""}</Text>
        </View>
      </View>

      <View style={styles.stats}>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>{containerCount}</Text>
          <Text style={styles.gray}>Asignados</Text>
        </View>
      </View>

      <View style={styles.card}>
        {info?.email && (
          <View style={styles.row}>
            <Text>📧 Correo</Text>
            <Text style={styles.gray}>{info.email}</Text>
          </View>
        )}
        <View style={styles.row}>
          <Text>🆔 Usuario</Text>
          <Text style={styles.gray}>{info?.username || ""}</Text>
        </View>
        <View style={[styles.row, { borderBottomWidth: 0 }]}>
          <Text>🔒 Rol</Text>
          <Text style={styles.gray}>Conductor</Text>
        </View>
      </View>

      <TouchableOpacity style={styles.logout} onPress={logout}>
        <Text style={{ color: "red", fontWeight: "bold" }}>Cerrar sesión</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5", padding: 16 },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 16 },
  profileCard: {
    flexDirection: "row", alignItems: "center", backgroundColor: "#fff",
    padding: 16, borderRadius: 16, marginBottom: 16,
  },
  avatar: {
    width: 50, height: 50, borderRadius: 25, backgroundColor: "#d0e8d0",
    justifyContent: "center", alignItems: "center", marginRight: 10,
  },
  avatarText: { fontWeight: "bold", color: "#2e7d32", fontSize: 16 },
  name: { fontWeight: "bold" },
  sub: { color: "#777" },
  stats: {
    flexDirection: "row", backgroundColor: "#fff", borderRadius: 16,
    marginBottom: 16, overflow: "hidden",
  },
  statItem: {
    flex: 1, alignItems: "center", padding: 16,
  },
  statNumber: { fontWeight: "bold", fontSize: 18, color: "#2e7d32" },
  card: { backgroundColor: "#fff", borderRadius: 16, marginBottom: 16 },
  row: {
    padding: 16, borderBottomWidth: 1, borderColor: "#eee",
    flexDirection: "row", justifyContent: "space-between",
  },
  gray: { color: "#777" },
  logout: {
    backgroundColor: "#fff", padding: 16, borderRadius: 20,
    alignItems: "center", marginTop: "auto", marginBottom: 20,
  },
});
