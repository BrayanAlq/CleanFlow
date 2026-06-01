import {
  View, Text, StyleSheet, TouchableOpacity, TextInput,
  ScrollView, Image, Alert,
} from "react-native";
import { Picker } from "@react-native-picker/picker";
import { useState, useEffect } from "react";
import * as ImagePicker from "expo-image-picker";
import api from "../services/api";

export default function ReportarScreen() {
  const [selected, setSelected] = useState("Mal olor");
  const [containerId, setContainerId] = useState(null);
  const [containers, setContainers] = useState([]);
  const [details, setDetails] = useState("");
  const [imageUri, setImageUri] = useState(null);
  const [uploadedIds, setUploadedIds] = useState([]);
  const [reports, setReports] = useState([]);
  const [sending, setSending] = useState(false);

  useEffect(() => {
    (async () => {
      try {
        const res = await api.get("/container/viewport", {
          params: { north: -11.5, south: -12.5, east: -76.5, west: -77.5 },
        });
        setContainers(res.data);
        if (res.data.length > 0) setContainerId(res.data[0].id);
      } catch (e) {}
    })();
  }, []);

  const options = [
    { title: "Basura fuera", subtitle: "Bolsas en la vereda" },
    { title: "Mal olor", subtitle: "Alimenta sensores MQ-135" },
    { title: "Tacho dañado", subtitle: "Roto o vandalizado" },
  ];

  const pickImage = async () => {
    const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      alert("Se necesita permiso para acceder a la galería");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      quality: 0.5,
    });
    if (!result.canceled) setImageUri(result.assets[0].uri);
  };

  const takePhoto = async () => {
    const permission = await ImagePicker.requestCameraPermissionsAsync();
    if (!permission.granted) {
      alert("Se necesita permiso para usar la cámara");
      return;
    }
    const result = await ImagePicker.launchCameraAsync({ quality: 0.5 });
    if (!result.canceled) setImageUri(result.assets[0].uri);
  };

  const handleReport = async () => {
    if (!containerId) {
      Alert.alert("Error", "Selecciona un contenedor");
      return;
    }
    setSending(true);
    try {
      let imageIds = [];
      if (imageUri) {
        const formData = new FormData();
        formData.append("images", {
          uri: imageUri,
          type: "image/jpeg",
          name: "report.jpg",
        });
        const imgRes = await api.post("/report-image", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        });
        imageIds = imgRes.data.map((img) => img.id);
      }

      await api.post("/report", {
        container_id: containerId,
        content: `${selected}: ${details}`,
        image_ids: imageIds,
      });

      const newReport = {
        id: Date.now().toString(),
        type: selected,
        details,
        status: "En revisión",
        time: "Ahora",
      };
      setReports([newReport, ...reports]);
      setDetails("");
      setImageUri(null);
      setUploadedIds([]);
      Alert.alert("Enviado", "Reporte enviado correctamente");
    } catch (e) {
      Alert.alert("Error", "No se pudo enviar el reporte");
    } finally {
      setSending(false);
    }
  };

  return (
    <View style={styles.container}>
      <ScrollView>
        <Text style={styles.title}>Reportar</Text>
        <Text style={styles.subtitle}>Ayuda a mejorar tu barrio</Text>

        <Text style={styles.label}>¿Qué quieres reportar?</Text>
        {options.map((item) => (
          <TouchableOpacity
            key={item.title}
            style={[styles.option, selected === item.title && styles.optionActive]}
            onPress={() => setSelected(item.title)}
          >
            <Text style={styles.bold}>{item.title}</Text>
            <Text style={styles.gray}>{item.subtitle}</Text>
          </TouchableOpacity>
        ))}

        <Text style={styles.label}>Contenedor cercano</Text>
        <View style={styles.select}>
          <Picker
            selectedValue={containerId}
            onValueChange={(v) => setContainerId(v)}
          >
            {containers.map((c) => (
              <Picker.Item
                key={c.id}
                label={`${c.name} · ${c.address_name || ""}`}
                value={c.id}
              />
            ))}
          </Picker>
        </View>

        <Text style={styles.label}>Detalles (opcional)</Text>
        <TextInput
          placeholder="Cuéntanos lo que ves..."
          style={styles.input} multiline
          value={details} onChangeText={setDetails}
        />

        <View style={{ flexDirection: "row", gap: 10 }}>
          <TouchableOpacity style={styles.photo} onPress={pickImage}>
            <Text>🖼️ Galería</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.photo} onPress={takePhoto}>
            <Text>📸 Cámara</Text>
          </TouchableOpacity>
        </View>

        {imageUri && (
          <Image source={{ uri: imageUri }} style={styles.preview} />
        )}

        <TouchableOpacity
          style={[styles.button, sending && { opacity: 0.6 }]}
          onPress={handleReport} disabled={sending}
        >
          <Text style={styles.buttonText}>
            {sending ? "Enviando..." : "Enviar reporte"}
          </Text>
        </TouchableOpacity>

        <Text style={styles.section}>Tus reportes</Text>
        {reports.length === 0 && (
          <Text style={styles.gray}>Aún no hay reportes</Text>
        )}
        {reports.map((item) => (
          <View key={item.id} style={styles.reportItem}>
            <View style={{ flex: 1 }}>
              <Text style={styles.bold}>{item.type}</Text>
              <Text style={styles.gray}>{item.time}</Text>
            </View>
            <Text style={styles.badgePending}>{item.status}</Text>
          </View>
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5", padding: 16 },
  title: { fontSize: 24, fontWeight: "bold" },
  subtitle: { color: "#666", marginBottom: 16 },
  label: { marginTop: 16, marginBottom: 8, fontWeight: "bold" },
  option: {
    backgroundColor: "#fff", padding: 16, borderRadius: 16, marginBottom: 10,
  },
  optionActive: {
    borderWidth: 2, borderColor: "#2e7d32", backgroundColor: "#eef7ef",
  },
  select: { backgroundColor: "#fff", borderRadius: 16, overflow: "hidden" },
  input: {
    backgroundColor: "#fff", padding: 16, borderRadius: 16,
    height: 100, textAlignVertical: "top",
  },
  photo: { marginTop: 10, backgroundColor: "#fff", padding: 12, borderRadius: 20 },
  preview: { width: "100%", height: 150, borderRadius: 12, marginTop: 10 },
  button: {
    marginTop: 20, backgroundColor: "#111", padding: 16,
    borderRadius: 30, alignItems: "center",
  },
  buttonText: { color: "#fff", fontWeight: "bold" },
  section: { marginTop: 20, fontWeight: "bold" },
  reportItem: {
    backgroundColor: "#fff", padding: 16, borderRadius: 16,
    marginTop: 10, flexDirection: "row", justifyContent: "space-between",
  },
  badgePending: {
    backgroundColor: "#fde7c7", paddingHorizontal: 10, paddingVertical: 5,
    borderRadius: 10, color: "#f57c00", alignSelf: "flex-start",
  },
  bold: { fontWeight: "bold" },
  gray: { color: "#777" },
});
