import { useEffect, useState, useCallback } from "react";
import {
  View, Text, StyleSheet, TouchableOpacity, TextInput,
  ScrollView, Image, Modal, Alert, FlatList,
} from "react-native";
import { Picker } from "@react-native-picker/picker";
import { Ionicons } from "@expo/vector-icons";
import AsyncStorage from "@react-native-async-storage/async-storage";
import * as ImagePicker from "expo-image-picker";
import api from "../services/api";

const REPORTS_KEY = "cf_reports";

const FALLBACK_CONTAINERS = [
  { id: 1, name: "CNT-001 · Parque H. Unanue" },
  { id: 2, name: "CNT-002 · Parque F. Carbajal" },
  { id: 3, name: "CNT-003 · Parque S. Bernales" },
  { id: 4, name: "CNT-004 · Cruce Canada / Brillantes" },
  { id: 5, name: "CNT-005 · Parque C. Socco" },
];

const options = [
  { title: "Basura fuera", subtitle: "Bolsas en la vereda" },
  { title: "Mal olor", subtitle: "Alimenta sensores MQ-135" },
  { title: "Tacho dañado", subtitle: "Roto o vandalizado" },
];

export default function ReportarScreen() {
  const [selected, setSelected] = useState("Mal olor");
  const [container, setContainer] = useState("1");
  const [containerOptions, setContainerOptions] = useState(FALLBACK_CONTAINERS);
  const [details, setDetails] = useState("");
  const [image, setImage] = useState(null);
  const [reports, setReports] = useState([]);
  const [sending, setSending] = useState(false);
  const [selectedReport, setSelectedReport] = useState(null);

  // Load containers from API
  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const res = await api.get("/container/viewport", {
          params: { north: -11.5, south: -12.5, east: -76.5, west: -77.5 },
        });
        if (!cancelled && Array.isArray(res.data) && res.data.length > 0) {
          const opts = res.data.map((c) => ({
            id: String(c.id),
            name: `${c.name || "CNT"} · ${c.address_name || ""}`,
          }));
          setContainerOptions(opts);
          if (opts.length > 0) setContainer(opts[0].id);
        }
      } catch {}
    })();
    return () => { cancelled = true; };
  }, []);

  // Load saved reports
  useEffect(() => {
    AsyncStorage.getItem(REPORTS_KEY).then((json) => {
      if (json) {
        try { setReports(JSON.parse(json)); } catch {}
      }
    });
  }, []);

  // Load reports from API
  useEffect(() => {
    (async () => {
      try {
        const res = await api.get("/report/mine?size=15");
        if (res.data?.content?.length > 0) {
          const apiReports = res.data.content.map((r) => ({
            id: String(r.id),
            type: r.content?.split(" — ")[0] || r.content,
            container: "",
            details: r.content?.includes(" — ") ? r.content.split(" — ").slice(1).join(" — ") : "",
            image: r.images?.[0]?.path || null,
            status: "En revision",
            time: new Date(r.timestamp).toLocaleString(),
          }));
          setReports((prev) => {
            const merged = [...apiReports, ...prev];
            return merged.slice(0, 50);
          });
        }
      } catch {}
    })();
  }, []);

  // Persist reports
  useEffect(() => {
    AsyncStorage.setItem(REPORTS_KEY, JSON.stringify(reports)).catch(() => {});
  }, [reports]);

  const pickImage = async () => {
    const perm = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!perm.granted) {
      Alert.alert("Permiso", "Se necesita permiso para acceder a la galeria");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      quality: 0.5,
    });
    if (!result.canceled) setImage(result.assets[0].uri);
  };

  const takePhoto = async () => {
    const perm = await ImagePicker.requestCameraPermissionsAsync();
    if (!perm.granted) {
      Alert.alert("Permiso", "Se necesita permiso para usar la camara");
      return;
    }
    const result = await ImagePicker.launchCameraAsync({ quality: 0.5 });
    if (!result.canceled) setImage(result.assets[0].uri);
  };

  const handleReport = async () => {
    setSending(true);
    try {
      let imageIds = [];
      if (image) {
        try {
          const formData = new FormData();
          formData.append("images", {
            uri: image, type: "image/jpeg", name: "photo.jpg",
          });
          const imgRes = await api.post("/report-image", formData, {
            headers: { "Content-Type": "multipart/form-data" },
          });
          if (Array.isArray(imgRes.data)) imageIds = imgRes.data.map((i) => i.id);
        } catch {}
      }

      const content = `${selected}${details ? " — " + details : ""}`;
      await api.post("/report", { content, container_id: Number(container), image_ids: imageIds });

      addReport("En revision");
      Alert.alert("Listo", "Reporte enviado");
    } catch {
      addReport("En revision (local)");
      Alert.alert("Aviso", "Reporte guardado");
    } finally {
      setSending(false);
    }
  };

  const addReport = (status) => {
    const newReport = {
      id: Date.now().toString(),
      type: selected,
      container: containerOptions.find((c) => String(c.id) === container)?.name || "",
      details,
      image,
      status,
      time: new Date().toLocaleString(),
    };
    setReports((prev) => [newReport, ...prev]);
    setDetails("");
    setImage(null);
  };

  const renderReport = useCallback(({ item }) => (
    <TouchableOpacity
      style={styles.reportItem}
      onPress={() => setSelectedReport(item)}
    >
      <View style={{ flex: 1 }}>
        <Text style={styles.bold}>{item.type}</Text>
        <Text style={styles.gray}>{item.container}</Text>
        <Text style={styles.timeText}>{item.time}</Text>
      </View>
      <View style={styles.badgePending}>
        <Text style={{ color: "#f57c00", fontSize: 13 }}>{item.status}</Text>
      </View>
    </TouchableOpacity>
  ), []);

  const renderHeader = () => (
    <View>
      <Text style={styles.title}>Reportar</Text>
      <Text style={styles.subtitle}>Ayuda a mejorar tu barrio</Text>

      <Text style={styles.label}>¿Que quieres reportar?</Text>
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
        <Picker selectedValue={container} onValueChange={(v) => setContainer(v)}>
          {containerOptions.map((c) => (
            <Picker.Item key={c.id} label={c.name} value={String(c.id)} />
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
        <TouchableOpacity style={styles.photo} onPress={pickImage} activeOpacity={0.7}>
          <Text><Ionicons name="image-outline" size={22} color="#555" /> Galería</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.photo} onPress={takePhoto} activeOpacity={0.7}>
          <Text><Ionicons name="camera-outline" size={22} color="#555" /> Cámara</Text>
        </TouchableOpacity>
      </View>

      {image && <Image source={{ uri: image }} style={styles.preview} />}

      <TouchableOpacity
        style={[styles.button, sending && { opacity: 0.6 }]}
        activeOpacity={0.7}
        onPress={handleReport}
        disabled={sending}
      >
        <Text style={styles.buttonText}>
          {sending ? "Enviando..." : "Enviar reporte"}
        </Text>
      </TouchableOpacity>

      <Text style={styles.section}>Tus reportes</Text>
      {reports.length === 0 && <Text style={styles.gray}>Aun no hay reportes</Text>}
    </View>
  );

  return (
    <View style={styles.container}>
      <FlatList
        data={reports}
        keyExtractor={(item) => item.id}
        renderItem={renderReport}
        ListHeaderComponent={renderHeader}
        contentContainerStyle={styles.listContent}
        showsVerticalScrollIndicator={false}
      />

      <Modal
        visible={!!selectedReport}
        animationType="slide"
        presentationStyle="pageSheet"
        transparent={false}
      >
        <View style={styles.modalContainer}>
          {selectedReport && (
            <>
              <View style={styles.modalHeader}>
                <TouchableOpacity onPress={() => setSelectedReport(null)}>
                  <Ionicons name="close" size={26} color="#333" />
                </TouchableOpacity>
                <Text style={styles.modalTitle}>Detalle del reporte</Text>
                <View style={{ width: 26 }} />
              </View>

              <ScrollView style={styles.modalBody}>
                <Text style={styles.detailLabel}>Tipo</Text>
                <Text style={styles.detailValue}>{selectedReport.type}</Text>

                <Text style={styles.detailLabel}>Contenedor</Text>
                <Text style={styles.detailValue}>{selectedReport.container}</Text>

                <Text style={styles.detailLabel}>Estado</Text>
                <View style={{ flexDirection: "row", alignItems: "center", marginBottom: 16 }}>
                  <View style={styles.badgePending}>
                    <Text style={{ color: "#f57c00", fontSize: 13 }}>{selectedReport.status}</Text>
                  </View>
                </View>

                <Text style={styles.detailLabel}>Fecha</Text>
                <Text style={styles.detailValue}>{selectedReport.time}</Text>

                {selectedReport.details ? (
                  <>
                    <Text style={styles.detailLabel}>Descripcion</Text>
                    <Text style={styles.detailText}>{selectedReport.details}</Text>
                  </>
                ) : null}

                {selectedReport.image ? (
                  <>
                    <Text style={styles.detailLabel}>Imagen</Text>
                    <Image source={{ uri: selectedReport.image }} style={styles.detailImage} />
                  </>
                ) : null}
              </ScrollView>
            </>
          )}
        </View>
      </Modal>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f5f5f5" },
  listContent: { padding: 16, paddingBottom: 30 },
  title: { fontSize: 24, fontWeight: "bold" },
  subtitle: { color: "#666", marginBottom: 12 },
  label: { marginTop: 8, marginBottom: 6, fontWeight: "bold", fontSize: 15 },
  option: {
    backgroundColor: "#fff", padding: 16, borderRadius: 16, marginBottom: 8,
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 3, shadowOffset: { width: 0, height: 1 },
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
    marginTop: 16, backgroundColor: "#111", padding: 16,
    borderRadius: 30, alignItems: "center",
  },
  buttonText: { color: "#fff", fontWeight: "bold" },
  section: { marginTop: 16, fontWeight: "bold" },
  reportItem: {
    backgroundColor: "#fff", padding: 16, borderRadius: 16, marginTop: 10,
    flexDirection: "row", justifyContent: "space-between", alignItems: "center",
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 3, shadowOffset: { width: 0, height: 1 },
  },
  timeText: { color: "#aaa", fontSize: 12, marginTop: 2 },
  badgePending: {
    backgroundColor: "#fde7c7", paddingHorizontal: 10, paddingVertical: 5,
    borderRadius: 10,
  },
  bold: { fontWeight: "bold" },
  gray: { color: "#777" },
  modalContainer: { flex: 1, backgroundColor: "#f5f5f5" },
  modalHeader: {
    flexDirection: "row", justifyContent: "space-between",
    alignItems: "center", paddingHorizontal: 16, paddingVertical: 14,
    backgroundColor: "#fff", borderBottomWidth: 1, borderColor: "#eee",
  },
  modalTitle: { fontSize: 17, fontWeight: "600" },
  modalBody: { padding: 20 },
  detailLabel: {
    fontSize: 13, fontWeight: "600", color: "#888",
    textTransform: "uppercase", marginBottom: 4,
  },
  detailValue: { fontSize: 16, color: "#222", marginBottom: 16 },
  detailText: { fontSize: 15, color: "#444", marginBottom: 16, lineHeight: 22 },
  detailImage: {
    width: "100%", height: 200, borderRadius: 12,
    marginBottom: 20, resizeMode: "cover",
  },
});
