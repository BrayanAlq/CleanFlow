import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  TextInput,
} from "react-native";
import { useState } from "react";

export default function PerfilScreen() {
  const [edit, setEdit] = useState(false);

  const [name, setName] = useState("María Vásquez");
  const [zone, setZone] = useState("Zona Norte");
  const [address, setAddress] = useState("Av. Los Olivos 245");

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi perfil</Text>

      {/* PERFIL */}
      <View style={styles.profileCard}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>
            {name.substring(0, 2).toUpperCase()}
          </Text>
        </View>

        <View style={{ flex: 1 }}>
          {edit ? (
            <>
              <TextInput
                value={name}
                onChangeText={setName}
                style={styles.input}
              />
              <TextInput
                value={zone}
                onChangeText={setZone}
                style={styles.input}
              />
            </>
          ) : (
            <>
              <Text style={styles.name}>{name}</Text>
              <Text style={styles.sub}>Vecino · {zone}</Text>
            </>
          )}
        </View>
      </View>

      {/* STATS */}
      <View style={styles.stats}>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>14</Text>
          <Text style={styles.gray}>Reportes</Text>
        </View>

        <View style={[styles.statItem, { borderRightWidth: 0 }]}>
          <Text style={styles.statNumber}>2</Text>
          <Text style={styles.gray}>Insignias</Text>
        </View>
      </View>

      {/* OPCIONES */}
      <View style={styles.card}>
        <View style={styles.row}>
          <Text>🏠 Mi dirección</Text>

          {edit ? (
            <TextInput
              value={address}
              onChangeText={setAddress}
              style={styles.inputSmall}
            />
          ) : (
            <Text style={styles.gray}>{address}</Text>
          )}
        </View>

        <TouchableOpacity style={styles.row}>
          <Text>🔔 Notificaciones</Text>
          <Text style={styles.gray}>Cercanía y alertas</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.row}>
          <Text>🛡️ Privacidad</Text>
        </TouchableOpacity>
      </View>

      {/* BOTÓN EDITAR / GUARDAR */}
      <TouchableOpacity
        style={styles.btn}
        onPress={() => setEdit(!edit)}
      >
        <Text>
          {edit ? "Guardar cambios" : "Editar perfil"}
        </Text>
      </TouchableOpacity>

      {/* LOGOUT */}
      <TouchableOpacity style={styles.logout}>
        <Text style={{ color: "red" }}>Cerrar sesión</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#f5f5f5",
    padding: 16,
  },

  title: {
    fontSize: 22,
    fontWeight: "bold",
    marginBottom: 16,
  },

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

  avatarText: {
    fontWeight: "bold",
    color: "#2e7d32",
  },

  name: {
    fontWeight: "bold",
  },

  sub: {
    color: "#777",
  },

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

  statNumber: {
    fontWeight: "bold",
    fontSize: 18,
  },

  card: {
    backgroundColor: "#fff",
    borderRadius: 16,
    marginBottom: 16,
  },

  row: {
    padding: 16,
    borderBottomWidth: 1,
    borderColor: "#eee",
  },

  btn: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 20,
    alignItems: "center",
    marginBottom: 10,
  },

  logout: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 20,
    alignItems: "center",
  },

  input: {
    backgroundColor: "#fff",
    borderRadius: 10,
    padding: 6,
    marginBottom: 5,
  },

  inputSmall: {
    backgroundColor: "#fff",
    borderRadius: 10,
    padding: 6,
    marginTop: 5,
  },

  gray: {
    color: "#777",
  },
});