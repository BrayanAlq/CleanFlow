import { useState, useContext } from "react";
import {
  View, Text, TextInput, TouchableOpacity, StyleSheet,
  KeyboardAvoidingView, Platform, ActivityIndicator,
} from "react-native";
import { AuthContext } from "../context/AuthContext";

export default function LoginScreen({ navigation }) {
  const { login } = useContext(AuthContext);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    if (!username.trim() || !password.trim()) {
      setError("Ingresa usuario y contraseña");
      return;
    }
    setLoading(true);
    setError("");
    try {
      await login(username, password);
    } catch (e) {
      console.log("ERROR LOGIN:", e?.response?.status, e?.response?.data, e?.message);
      const msg = e.response?.data?.message || e.message || "Credenciales inválidas";
      setError(msg);
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
    >
      <View style={styles.inner}>
        <Text style={styles.logo}>🗑️</Text>
        <Text style={styles.title}>CleanFlow</Text>
        <Text style={styles.subtitle}>Gestión de residuos inteligente</Text>

        <TextInput
          style={styles.input}
          placeholder="Usuario"
          placeholderTextColor="#999"
          value={username}
          onChangeText={setUsername}
          autoCapitalize="none"
        />
        <TextInput
          style={styles.input}
          placeholder="Contraseña"
          placeholderTextColor="#999"
          value={password}
          onChangeText={setPassword}
          secureTextEntry
        />

        {error ? <Text style={styles.error}>{error}</Text> : null}

        <TouchableOpacity
          style={[styles.button, loading && styles.buttonDisabled]}
          onPress={handleLogin}
          disabled={loading}
        >
          {loading ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Text style={styles.buttonText}>Iniciar sesión</Text>
          )}
        </TouchableOpacity>

        <TouchableOpacity onPress={() => navigation.navigate("RegisterCitizen")}>
          <Text style={styles.link}>Registrarse como vecino</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => navigation.navigate("RegisterDriver")}>
          <Text style={styles.link}>Registrarse como conductor</Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5" },
  inner: {
    flex: 1, justifyContent: "center", alignItems: "center",
    padding: 32,
  },
  logo: { fontSize: 80, marginBottom: 16 },
  title: { fontSize: 32, fontWeight: "bold", color: "#2e7d32", marginBottom: 4 },
  subtitle: { fontSize: 16, color: "#666", marginBottom: 32, textAlign: "center" },
  input: {
    width: "100%", backgroundColor: "#fff", padding: 16,
    borderRadius: 16, marginBottom: 12, fontSize: 16,
  },
  error: { color: "#e53935", marginBottom: 8 },
  button: {
    width: "100%", backgroundColor: "#2e7d32", padding: 18,
    borderRadius: 30, alignItems: "center", marginBottom: 16,
  },
  buttonDisabled: { opacity: 0.6 },
  buttonText: { color: "#fff", fontWeight: "bold", fontSize: 16 },
  link: { color: "#2e7d32", marginTop: 8, fontSize: 14 },
});
