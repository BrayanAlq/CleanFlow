import { useState, useContext } from "react";
import {
  View, Text, TextInput, TouchableOpacity, StyleSheet,
  KeyboardAvoidingView, Platform, ScrollView, Alert,
} from "react-native";
import MapView, { Marker } from "../components/MapView";
import { AuthContext } from "../context/AuthContext";

export default function RegisterCitizenScreen({ navigation }) {
  const { registerResident } = useContext(AuthContext);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirm, setConfirm] = useState("");
  const [email, setEmail] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [latitude, setLatitude] = useState(-12.0464);
  const [longitude, setLongitude] = useState(-77.0428);
  const [loading, setLoading] = useState(false);

  const handleRegister = async () => {
    if (!username.trim() || !password.trim() || !email.trim() ||
        !firstName.trim() || !lastName.trim()) {
      Alert.alert("Error", "Completa todos los campos");
      return;
    }
    if (password !== confirm) {
      Alert.alert("Error", "Las contraseñas no coinciden");
      return;
    }
    setLoading(true);
    try {
      await registerResident({
        username: username.trim(),
        password,
        email: email.trim(),
        first_name: firstName.trim(),
        last_name: lastName.trim(),
        latitude,
        longitude,
      });
      Alert.alert(
        "Registro exitoso",
        "Ahora puedes iniciar sesión",
        [{ text: "OK", onPress: () => navigation.goBack() }]
      );
    } catch (e) {
      const msg = e.response?.data?.message || "Error al registrarse";
      Alert.alert("Error", msg);
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
    >
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={styles.title}>Registro vecino</Text>
        <Text style={styles.subtitle}>Crea tu cuenta de residente</Text>

        <TextInput style={styles.input} placeholder="Usuario" value={username}
          onChangeText={setUsername} autoCapitalize="none" />
        <TextInput style={styles.input} placeholder="Correo electrónico" value={email}
          onChangeText={setEmail} autoCapitalize="none" keyboardType="email-address" />
        <TextInput style={styles.input} placeholder="Nombres" value={firstName}
          onChangeText={setFirstName} />
        <TextInput style={styles.input} placeholder="Apellidos" value={lastName}
          onChangeText={setLastName} />
        <TextInput style={styles.input} placeholder="Contraseña" value={password}
          onChangeText={setPassword} secureTextEntry />
        <TextInput style={styles.input} placeholder="Confirmar contraseña" value={confirm}
          onChangeText={setConfirm} secureTextEntry />

        <Text style={styles.label}>Selecciona tu ubicación en el mapa</Text>
        <MapView
          style={styles.map}
          initialRegion={{
            latitude: -12.0464, longitude: -77.0428,
            latitudeDelta: 0.05, longitudeDelta: 0.05,
          }}
          onPress={(e) => {
            setLatitude(e.nativeEvent.coordinate.latitude);
            setLongitude(e.nativeEvent.coordinate.longitude);
          }}
        >
          <Marker
            coordinate={{ latitude, longitude }}
            draggable
            onDragEnd={(e) => {
              setLatitude(e.nativeEvent.coordinate.latitude);
              setLongitude(e.nativeEvent.coordinate.longitude);
            }}
          />
        </MapView>
        <Text style={styles.coords}>
          {latitude.toFixed(4)}, {longitude.toFixed(4)}
        </Text>

        <TouchableOpacity
          style={[styles.button, loading && styles.buttonDisabled]}
          onPress={handleRegister} disabled={loading}
        >
          <Text style={styles.buttonText}>
            {loading ? "Registrando..." : "Registrarse"}
          </Text>
        </TouchableOpacity>

        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Text style={styles.link}>Ya tengo cuenta</Text>
        </TouchableOpacity>
      </ScrollView>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5" },
  scroll: { padding: 24, paddingBottom: 40 },
  title: { fontSize: 24, fontWeight: "bold", marginBottom: 4 },
  subtitle: { color: "#666", marginBottom: 20 },
  input: {
    backgroundColor: "#fff", padding: 14, borderRadius: 14,
    marginBottom: 10, fontSize: 15,
  },
  label: { fontWeight: "bold", marginTop: 12, marginBottom: 8 },
  map: { height: 250, borderRadius: 16, marginBottom: 6 },
  coords: { textAlign: "center", color: "#666", marginBottom: 16, fontSize: 13 },
  button: {
    backgroundColor: "#2e7d32", padding: 16, borderRadius: 30,
    alignItems: "center", marginTop: 8,
  },
  buttonDisabled: { opacity: 0.6 },
  buttonText: { color: "#fff", fontWeight: "bold", fontSize: 16 },
  link: { color: "#2e7d32", textAlign: "center", marginTop: 16, fontSize: 14 },
});
