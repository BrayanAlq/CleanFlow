import { useContext, useState, useEffect } from "react";
import {
  View, Text, StyleSheet, TouchableOpacity, TextInput,
  Modal, Alert, KeyboardAvoidingView, Platform,
} from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { Ionicons } from "@expo/vector-icons";
import { AuthContext } from "../context/AuthContext";
import api from "../services/api";

export default function PerfilCiudadano() {
  const { user, logout } = useContext(AuthContext);
  const [profile, setProfile] = useState(null);
  const [showModal, setShowModal] = useState(false);

  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [editName, setEditName] = useState("");
  const [editAddress, setEditAddress] = useState("");

  useEffect(() => {
    (async () => {
      try {
        const res = await api.get("/resident");
        setProfile(res.data);
        const fullName = [res.data.first_name, res.data.last_name].filter(Boolean).join(" ");
        setName(fullName || "Vecino");
        setAddress(res.data.address || "");
      } catch (e) {}
    })();
  }, []);

  const displayName = name || (user?.firstName ? `${user.firstName} ${user.lastName}` : "Vecino");
  const initials = displayName
    .split(" ")
    .map((s) => s[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);

  const reportCount = profile?.report_count ?? user?.report_count ?? 0;

  const openEdit = () => {
    setEditName(name);
    setEditAddress(address);
    setShowModal(true);
  };

  const handleSave = async () => {
    try {
      await api.patch("/resident", {
        first_name: editName.split(" ")[0],
        last_name: editName.split(" ").slice(1).join(" ") || editName,
        address: editAddress,
      });
      setName(editName);
      setAddress(editAddress);
      setShowModal(false);
      Alert.alert("Listo", "Perfil actualizado");
    } catch (e) {
      Alert.alert("Error", e.response?.data?.message || e.message);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi perfil</Text>

      <View style={styles.profileCard}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>{initials}</Text>
        </View>
        <View style={{ flex: 1 }}>
          <Text style={styles.name}>{displayName}</Text>
          <Text style={styles.sub}>Vecino</Text>
        </View>
      </View>

      <View style={styles.stats}>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>{reportCount}</Text>
          <Text style={styles.gray}>Reportes</Text>
        </View>
      </View>

      <View style={styles.card}>
        {address ? (
          <View style={styles.row}>
            <Text><Ionicons name="home-outline" size={20} /> Mi dirección</Text>
            <Text style={styles.gray}>{address}</Text>
          </View>
        ) : null}
        {profile?.email ? (
          <View style={styles.row}>
            <Text><Ionicons name="mail-outline" size={20} /> Correo</Text>
            <Text style={styles.gray}>{profile.email}</Text>
          </View>
        ) : null}
        <TouchableOpacity style={styles.row}>
          <Text><Ionicons name="notifications-outline" size={20} /> Notificaciones</Text>
          <Text style={styles.gray}>Cercanía y alertas</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.row, { borderBottomWidth: 0 }]}>
          <Text><Ionicons name="shield-outline" size={20} /> Privacidad</Text>
        </TouchableOpacity>
      </View>

      <TouchableOpacity style={styles.btn} onPress={openEdit} activeOpacity={0.7}>
        <Text>Editar perfil</Text>
      </TouchableOpacity>

      <TouchableOpacity style={styles.logout} onPress={logout} activeOpacity={0.7}>
        <Text style={{ color: "red" }}>Cerrar sesión</Text>
      </TouchableOpacity>

      <Modal visible={showModal} animationType="slide" presentationStyle="pageSheet">
        <SafeAreaView style={styles.modalContainer}>
          <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : undefined}
            style={{ flex: 1 }}
          >
            <View style={styles.modalHeader}>
              <TouchableOpacity onPress={() => setShowModal(false)}>
                <Ionicons name="close" size={26} color="#333" />
              </TouchableOpacity>
              <Text style={styles.modalTitle}>Editar perfil</Text>
              <TouchableOpacity onPress={handleSave}>
                <Text style={styles.saveText}>Guardar</Text>
              </TouchableOpacity>
            </View>

            <View style={styles.modalBody}>
              <Text style={styles.label}>Nombre completo</Text>
              <TextInput
                value={editName}
                onChangeText={setEditName}
                style={styles.field}
                placeholder="Maria Vasquez"
              />

              <Text style={styles.label}>Dirección</Text>
              <TextInput
                value={editAddress}
                onChangeText={setEditAddress}
                style={styles.field}
                placeholder="Av. Los Olivos 245"
              />
            </View>
          </KeyboardAvoidingView>
        </SafeAreaView>
      </Modal>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5", padding: 16 },
  title: { fontSize: 22, fontWeight: "bold", marginBottom: 16 },
  profileCard: {
    flexDirection: "row", alignItems: "center", backgroundColor: "#fff",
    padding: 16, borderRadius: 16, marginBottom: 16,
    elevation: 2, shadowColor: "#000", shadowOpacity: 0.06,
    shadowRadius: 6, shadowOffset: { width: 0, height: 2 },
  },
  avatar: {
    width: 50, height: 50, borderRadius: 25, backgroundColor: "#d0e8d0",
    justifyContent: "center", alignItems: "center", marginRight: 10,
  },
  avatarText: { fontWeight: "bold", color: "#2e7d32" },
  name: { fontWeight: "bold" },
  sub: { color: "#777" },
  stats: {
    flexDirection: "row", backgroundColor: "#fff", borderRadius: 16,
    marginBottom: 16, overflow: "hidden",
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 4, shadowOffset: { width: 0, height: 1 },
  },
  statItem: { flex: 1, alignItems: "center", padding: 16 },
  statNumber: { fontWeight: "bold", fontSize: 18 },
  card: {
    backgroundColor: "#fff", borderRadius: 16, marginBottom: 16,
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 4, shadowOffset: { width: 0, height: 1 },
  },
  row: {
    padding: 16, borderBottomWidth: 1, borderColor: "#eee",
  },
  btn: {
    backgroundColor: "#fff", padding: 16, borderRadius: 20,
    alignItems: "center", marginBottom: 10,
  },
  logout: {
    backgroundColor: "#fff", padding: 16, borderRadius: 20,
    alignItems: "center",
  },
  gray: { color: "#777" },
  modalContainer: { flex: 1, backgroundColor: "#f5f5f5" },
  modalHeader: {
    flexDirection: "row", justifyContent: "space-between",
    alignItems: "center", paddingHorizontal: 16, paddingVertical: 14,
    backgroundColor: "#fff", borderBottomWidth: 1, borderColor: "#eee",
  },
  modalTitle: { fontSize: 17, fontWeight: "600" },
  saveText: { fontSize: 16, fontWeight: "600", color: "#2e7d32" },
  modalBody: { padding: 20 },
  label: {
    fontSize: 14, fontWeight: "600", color: "#555",
    marginBottom: 6, marginTop: 16,
  },
  field: {
    backgroundColor: "#fff", padding: 14, borderRadius: 12,
    fontSize: 16, borderWidth: 1, borderColor: "#e0e0e0",
  },
});
