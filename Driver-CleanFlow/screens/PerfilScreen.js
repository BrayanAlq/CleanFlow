import { useContext } from "react";
import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { AuthContext } from "../App";
import { DRIVER, BINS } from "../data/mock";

export default function PerfilScreen() {
  const { setIsAuthenticated } = useContext(AuthContext);
  const collectedToday = BINS.filter((b) => b.collected).length;

  const handleLogout = () => {
    setIsAuthenticated(false);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi perfil</Text>

      <View style={styles.profileCard}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>
            {DRIVER.firstName.substring(0, 1)}
            {DRIVER.lastName.substring(0, 1)}
          </Text>
        </View>
        <View style={{ flex: 1 }}>
          <Text style={styles.name}>
            {DRIVER.firstName} {DRIVER.lastName}
          </Text>
          <Text style={styles.sub}>Conductor · {DRIVER.username}</Text>
        </View>
      </View>

      <View style={styles.stats}>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>{collectedToday}</Text>
          <Text style={styles.gray}>Hoy</Text>
        </View>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>
            {BINS.length - collectedToday}
          </Text>
          <Text style={styles.gray}>Pendientes</Text>
        </View>
        <View style={[styles.statItem, { borderRightWidth: 0 }]}>
          <Text style={styles.statNumber}>{BINS.length}</Text>
          <Text style={styles.gray}>Asignados</Text>
        </View>
      </View>

      <View style={styles.card}>
        <View style={styles.row}>
          <Text>📧 Correo</Text>
          <Text style={styles.gray}>{DRIVER.email}</Text>
        </View>
        <View style={styles.row}>
          <Text>🆔 Usuario</Text>
          <Text style={styles.gray}>{DRIVER.username}</Text>
        </View>
        <View style={[styles.row, { borderBottomWidth: 0 }]}>
          <Text>🔒 Rol</Text>
          <Text style={styles.gray}>{DRIVER.role}</Text>
        </View>
      </View>

      <TouchableOpacity style={styles.logout} onPress={handleLogout}>
        <Text style={{ color: "red", fontWeight: "bold" }}>
          Cerrar sesión
        </Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5", padding: 16 },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 16 },
  profileCard: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 16,
    marginBottom: 16,
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: "#d0e8d0",
    justifyContent: "center",
    alignItems: "center",
    marginRight: 10,
  },
  avatarText: { fontWeight: "bold", color: "#2e7d32", fontSize: 16 },
  name: { fontWeight: "bold" },
  sub: { color: "#777" },
  stats: {
    flexDirection: "row",
    backgroundColor: "#fff",
    borderRadius: 16,
    marginBottom: 16,
    overflow: "hidden",
  },
  statItem: {
    flex: 1,
    alignItems: "center",
    padding: 16,
    borderRightWidth: 1,
    borderColor: "#eee",
  },
  statNumber: { fontWeight: "bold", fontSize: 18, color: "#2e7d32" },
  card: { backgroundColor: "#fff", borderRadius: 16, marginBottom: 16 },
  row: {
    padding: 16,
    borderBottomWidth: 1,
    borderColor: "#eee",
    flexDirection: "row",
    justifyContent: "space-between",
  },
  gray: { color: "#777" },
  logout: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 20,
    alignItems: "center",
    marginTop: "auto",
    marginBottom: 20,
  },
});
