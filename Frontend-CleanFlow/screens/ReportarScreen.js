import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  TextInput,
  ScrollView,
  Image,
} from "react-native";
import { Picker } from "@react-native-picker/picker";
import { useState } from "react";
import * as ImagePicker from "expo-image-picker";

export default function ReportarScreen() {
  const [selected, setSelected] = useState("Mal olor");
  const [container, setContainer] = useState("CNT-001");
  const [details, setDetails] = useState("");
  const [image, setImage] = useState(null);
  const [reports, setReports] = useState([]);

  const options = [
    { title: "Basura fuera", subtitle: "Bolsas en la vereda" },
    { title: "Mal olor", subtitle: "Alimenta sensores MQ-135" },
    { title: "Tacho dañado", subtitle: "Roto o vandalizado" },
  ];

  // 🖼️ GALERÍA
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

    if (!result.canceled) {
      setImage(result.assets[0].uri);
    }
  };

  // 📸 CÁMARA
  const takePhoto = async () => {
    const permission = await ImagePicker.requestCameraPermissionsAsync();

    if (!permission.granted) {
      alert("Se necesita permiso para usar la cámara");
      return;
    }

    const result = await ImagePicker.launchCameraAsync({
      quality: 0.5,
    });

    if (!result.canceled) {
      setImage(result.assets[0].uri);
    }
  };

  // 🚀 ENVIAR REPORTE
  const handleReport = () => {
    const newReport = {
      id: Date.now().toString(),
      type: selected,
      container: container,
      details: details,
      image: image,
      status: "En revisión",
      time: "Ahora",
    };

    setReports([newReport, ...reports]);

    // limpiar
    setDetails("");
    setImage(null);
  };

  return (
    <View style={styles.container}>
      <ScrollView>

        <Text style={styles.title}>Reportar</Text>
        <Text style={styles.subtitle}>Ayuda a mejorar tu barrio</Text>

        {/* OPCIONES */}
        <Text style={styles.label}>¿Qué quieres reportar?</Text>

        {options.map((item) => (
          <TouchableOpacity
            key={item.title}
            style={[
              styles.option,
              selected === item.title && styles.optionActive,
            ]}
            onPress={() => setSelected(item.title)}
          >
            <Text style={styles.bold}>{item.title}</Text>
            <Text style={styles.gray}>{item.subtitle}</Text>
          </TouchableOpacity>
        ))}

        {/* SELECT */}
        <Text style={styles.label}>Contenedor cercano</Text>

        <View style={styles.select}>
          <Picker
            selectedValue={container}
            onValueChange={(itemValue) => setContainer(itemValue)}
          >
            <Picker.Item label="CNT-001 · Av. Los Olivos 245" value="CNT-001" />
            <Picker.Item label="CNT-002 · Jr. Lampa 480" value="CNT-002" />
            <Picker.Item label="CNT-003 · Av. Benavides 1820" value="CNT-003" />
            <Picker.Item label="CNT-004 · Av. La Molina 540" value="CNT-004" />
            <Picker.Item label="CNT-005 · Av. Los Olivos 410" value="CNT-005" />
          </Picker>
        </View>

        {/* DETALLES */}
        <Text style={styles.label}>Detalles (opcional)</Text>

        <TextInput
          placeholder="Cuéntanos lo que ves..."
          style={styles.input}
          multiline
          value={details}
          onChangeText={setDetails}
        />

        {/* BOTONES FOTO */}
        <View style={{ flexDirection: "row", gap: 10 }}>
          <TouchableOpacity style={styles.photo} onPress={pickImage}>
            <Text>🖼️ Galería</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.photo} onPress={takePhoto}>
            <Text>📸 Cámara</Text>
          </TouchableOpacity>
        </View>

        {/* PREVIEW */}
        {image && (
          <Image source={{ uri: image }} style={styles.preview} />
        )}

        {/* BOTÓN */}
        <TouchableOpacity style={styles.button} onPress={handleReport}>
          <Text style={styles.buttonText}>Enviar reporte</Text>
        </TouchableOpacity>

        {/* LISTA */}
        <Text style={styles.section}>Tus reportes</Text>

        {reports.length === 0 && (
          <Text style={styles.gray}>Aún no hay reportes</Text>
        )}

        {reports.map((item) => (
          <View key={item.id} style={styles.reportItem}>
            <View style={{ flex: 1 }}>
              <Text style={styles.bold}>{item.type}</Text>
              <Text style={styles.gray}>
                {item.container} · {item.time}
              </Text>

              {item.image && (
                <Image
                  source={{ uri: item.image }}
                  style={styles.reportImage}
                />
              )}
            </View>

            <Text style={styles.badgePending}>
              {item.status}
            </Text>
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
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 16,
    marginBottom: 10,
  },

  optionActive: {
    borderWidth: 2,
    borderColor: "#2e7d32",
    backgroundColor: "#eef7ef",
  },

  select: {
    backgroundColor: "#fff",
    borderRadius: 16,
    overflow: "hidden",
  },

  input: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 16,
    height: 100,
    textAlignVertical: "top",
  },

  photo: {
    marginTop: 10,
    backgroundColor: "#fff",
    padding: 12,
    borderRadius: 20,
  },

  preview: {
    width: "100%",
    height: 150,
    borderRadius: 12,
    marginTop: 10,
  },

  button: {
    marginTop: 20,
    backgroundColor: "#111",
    padding: 16,
    borderRadius: 30,
    alignItems: "center",
  },

  buttonText: { color: "#fff", fontWeight: "bold" },

  section: {
    marginTop: 20,
    fontWeight: "bold",
  },

  reportItem: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 16,
    marginTop: 10,
    flexDirection: "row",
    justifyContent: "space-between",
  },

  reportImage: {
    width: 60,
    height: 60,
    borderRadius: 10,
    marginTop: 5,
  },

  badgePending: {
    backgroundColor: "#fde7c7",
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 10,
    color: "#f57c00",
    alignSelf: "flex-start",
  },

  bold: { fontWeight: "bold" },
  gray: { color: "#777" },
});