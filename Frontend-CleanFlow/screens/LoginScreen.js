import { useState, useContext } from "react";
import {
  View, Text, TextInput, TouchableOpacity, StyleSheet,
  KeyboardAvoidingView, Platform, ActivityIndicator,
} from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { AuthContext } from "../context/AuthContext";

export default function LoginScreen({ navigation }) {
  const { login } = useContext(AuthContext);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
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
        <Text style={styles.title}>CleanFlow</Text>
        <Text style={styles.subtitle}>Inicia sesión</Text>

        {error ? <Text style={styles.error}>{error}</Text> : null}

        <TextInput
          placeholder="Usuario"
          style={styles.input}
          value={username}
          onChangeText={setUsername}
          autoCapitalize="none"
        />

        <View style={styles.passRow}>
          <TextInput
            placeholder="Contraseña"
            style={styles.passInput}
            value={password}
            onChangeText={setPassword}
            secureTextEntry={!showPassword}
          />
          <TouchableOpacity
            style={styles.eyeBtn}
            onPress={() => setShowPassword(!showPassword)}
          >
            <Ionicons
              name={showPassword ? "eye-outline" : "eye-off-outline"}
              size={22}
              color="#888"
            />
          </TouchableOpacity>
        </View>

        <TouchableOpacity
          style={[styles.button, loading && { opacity: 0.6 }]}
          onPress={handleLogin}
          disabled={loading}
        >
          {loading ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Text style={styles.buttonText}>Entrar</Text>
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
    flex: 1, justifyContent: "center",
    padding: 24,
  },
  title: {
    fontSize: 28, fontWeight: "bold", color: "#2e7d32",
    textAlign: "center",
  },
  subtitle: {
    textAlign: "center", color: "#666", marginBottom: 24,
  },
  input: {
    backgroundColor: "#fff", padding: 14, borderRadius: 14,
    marginBottom: 12, fontSize: 16,
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.03,
    shadowRadius: 3, shadowOffset: { width: 0, height: 1 },
  },
  passRow: {
    flexDirection: "row", alignItems: "center",
    backgroundColor: "#fff", borderRadius: 14, marginBottom: 12,
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.03,
    shadowRadius: 3, shadowOffset: { width: 0, height: 1 },
  },
  passInput: { flex: 1, padding: 14, fontSize: 16 },
  eyeBtn: { paddingHorizontal: 14 },
  error: { color: "#e53935", textAlign: "center", marginBottom: 12 },
  button: {
    backgroundColor: "#111", padding: 16, borderRadius: 30,
    alignItems: "center", marginTop: 8,
  },
  buttonText: { color: "#fff", fontWeight: "bold", fontSize: 16 },
  link: { textAlign: "center", color: "#2e7d32", marginTop: 16 },
});
