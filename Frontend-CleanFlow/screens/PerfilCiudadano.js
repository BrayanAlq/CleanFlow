import { useContext, useState, useEffect } from "react";
import {
  View, Text, StyleSheet, TouchableOpacity, ActivityIndicator,
} from "react-native";
import { AuthContext } from "../context/AuthContext";
import api from "../services/api";

export default function PerfilCiudadano() {
  const { user, logout } = useContext(AuthContext);
  const [profile, setProfile] = useState(null);

  useEffect(() => {
    (async () => {
      try {
        const res = await api.get("/resident");
        setProfile(res.data);
      } catch (e) {}
    })();
  }, []);

  const name = profile
    ? `${profile.first_name || ""} ${profile.last_name || ""}`
    : user?.firstName
      ? `${user.firstName} ${user.lastName}`
      : "Vecino";

  const initials = name
    .split(" ")
    .map((s) => s[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi perfil</Text>

      <View style={styles.profileCard}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>{initials}</Text>
        </View>
        <View style={{ flex: 1 }}>
          <Text style={styles.name}>{name}</Text>
          <Text style={styles.sub}>Vecino</Text>
        </View>
      </View>

      {profile && (
        <View style={styles.card}>
          {profile.email && (
            <View style={styles.row}>
              <Text>📧 Correo</Text>
              <Text style={styles.gray}>{profile.email}</Text>
            </View>
          )}
          {profile.latitude && (
            <View style={[styles.row, { borderBottomWidth: 0 }]}>
              <Text>📍 Ubicación</Text>
              <Text style={styles.gray}>
                {profile.latitude.toFixed(4)}, {profile.longitude.toFixed(4)}
              </Text>
            </View>
          )}
        </View>
      )}

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
  avatarText: { fontWeight: "bold", color: "#2e7d32" },
  name: { fontWeight: "bold" },
  sub: { color: "#777" },
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
