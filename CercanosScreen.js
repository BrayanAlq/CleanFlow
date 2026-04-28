import {
  View,
  Text,
  StyleSheet,
  TextInput,
  ScrollView,
  TouchableOpacity,
  Linking,
} from "react-native";
import MapView, { Marker, Polyline } from "react-native-maps";
import * as Location from "expo-location";
import { useEffect, useState } from "react";

const bins = [
  {
    id: "1",
    name: "Av. Los Olivos 410",
    percent: 18,
    status: "Disponible",
    type: "Reciclable",
    latitude: -11.991,
    longitude: -77.070,
  },
  {
    id: "2",
    name: "Av. Benavides 1820",
    percent: 28,
    status: "Disponible",
    type: "General",
    latitude: -12.135,
    longitude: -77.020,
  },
  {
    id: "3",
    name: "Jr. Lampa 480",
    percent: 64,
    status: "Disponible",
    type: "Reciclable",
    latitude: -12.046,
    longitude: -77.030,
  },
  {
    id: "4",
    name: "Av. La Molina 540",
    percent: 88,
    status: "Lleno",
    type: "General",
    latitude: -12.085,
    longitude: -76.945,
  },
  {
    id: "5",
    name: "Av. Los Olivos 245",
    percent: 92,
    status: "Lleno",
    type: "Orgánica",
    latitude: -11.9905,
    longitude: -77.065,
  },
];

const getColor = (percent) => {
  if (percent >= 85) return "#e53935";
  if (percent >= 60) return "#f9a825";
  return "#2e7d32";
};

export default function CercanosScreen() {
  const [location, setLocation] = useState(null);

  // 🚛 CAMIÓN
  const [driverLocation, setDriverLocation] = useState({
    latitude: -12.0464,
    longitude: -77.0428,
  });

  // 🛣️ RUTA
  const [route, setRoute] = useState([]);

  // 📍 UBICACIÓN USUARIO
  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== "granted") return;

      let loc = await Location.getCurrentPositionAsync({});
      setLocation(loc.coords);
    })();
  }, []);

  // 🚛 SIMULAR MOVIMIENTO
  useEffect(() => {
    const interval = setInterval(() => {
      setDriverLocation((prev) => ({
        latitude: prev.latitude + 0.0003,
        longitude: prev.longitude + 0.0003,
      }));
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  // 🛣️ GUARDAR RUTA
  useEffect(() => {
    setRoute((prev) => [...prev, driverLocation]);
  }, [driverLocation]);

  // ✔️ SABER SI YA PASÓ
  const isVisited = (bin) => {
    return route.some(
      (point) =>
        Math.abs(point.latitude - bin.latitude) < 0.001 &&
        Math.abs(point.longitude - bin.longitude) < 0.001
    );
  };

  // 🧭 DIRECCIONES
  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=walking`;
    Linking.openURL(url).catch(() =>
      alert("No se pudo abrir el mapa")
    );
  };

  // 🧠 MEJOR TACHO
  const bestBin = bins.reduce((prev, curr) =>
    curr.percent < prev.percent ? curr : prev
  );

  return (
    <View style={styles.container}>
      <ScrollView>

        {/* 🔍 BUSCADOR */}
        <View style={styles.search}>
          <TextInput placeholder="Buscar dirección" />
        </View>

        {/* 🗺️ MAPA */}
        <MapView
          style={styles.map}
          region={
            location && {
              latitude: location.latitude,
              longitude: location.longitude,
              latitudeDelta: 0.05,
              longitudeDelta: 0.05,
            }
          }
          initialRegion={{
            latitude: -12.0464,
            longitude: -77.0428,
            latitudeDelta: 0.05,
            longitudeDelta: 0.05,
          }}
          showsUserLocation={true}
        >

          {/* 🚛 CAMIÓN */}
          <Marker coordinate={driverLocation} title="Camión recolector">
            <Text style={{ fontSize: 22 }}>🚛</Text>
          </Marker>

          {/* 🛣️ RUTA */}
          <Polyline
            coordinates={route}
            strokeWidth={4}
            strokeColor="#2e7d32"
          />

          {/* 📍 TACHOS */}
          {bins.map((bin) => (
            <Marker
              key={bin.id}
              coordinate={{
                latitude: bin.latitude,
                longitude: bin.longitude,
              }}
              title={bin.name}
              description={`${bin.percent}% - ${bin.status}`}
            >
              <View
                style={[
                  styles.marker,
                  {
                    backgroundColor: isVisited(bin)
                      ? "#999"
                      : getColor(bin.percent),
                  },
                ]}
              >
                <Text style={styles.markerText}>{bin.percent}</Text>
              </View>
            </Marker>
          ))}
        </MapView>

        {/* 💡 SUGERENCIA */}
        <View style={styles.suggestion}>
          <Text style={styles.suggestTitle}>Sugerencia</Text>

          <Text style={styles.bold}>
            El tacho de {bins.find(b => b.percent >= 85)?.name} está lleno
          </Text>

          <Text style={styles.gray}>
            Ve a {bestBin.name} ({bestBin.percent}% disponible)
          </Text>

          <TouchableOpacity
            style={styles.button}
            onPress={() =>
              openDirections(bestBin.latitude, bestBin.longitude)
            }
          >
            <Text style={styles.buttonText}>Cómo llegar</Text>
          </TouchableOpacity>
        </View>

        {/* 📋 LISTA */}
        <Text style={styles.section}>En tu cuadra</Text>
        <Text style={styles.sub}>
          {bins.length} contenedores cercanos
        </Text>

        {bins.map((item) => (
          <TouchableOpacity
            key={item.id}
            style={styles.card}
            onPress={() =>
              openDirections(item.latitude, item.longitude)
            }
          >
            <View>
              <Text style={styles.bold}>{item.name}</Text>
              <Text style={styles.gray}>{item.type}</Text>
            </View>

            <View style={{ alignItems: "flex-end" }}>
              <Text style={styles.bold}>{item.percent}%</Text>
              <Text style={{ color: getColor(item.percent) }}>
                {item.status}
              </Text>
            </View>
          </TouchableOpacity>
        ))}

      </ScrollView>
    </View>
  );
}
const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f2f2f2" },

  search: {
    margin: 16,
    backgroundColor: "#fff",
    padding: 12,
    borderRadius: 20,
  },

  map: {
    height: 300,
    marginHorizontal: 16,
    borderRadius: 20,
  },

  marker: {
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: "center",
    alignItems: "center",
  },

  markerText: {
    color: "#fff",
    fontWeight: "bold",
  },

  suggestion: {
    margin: 16,
    backgroundColor: "#f6efe6",
    padding: 16,
    borderRadius: 16,
    borderWidth: 1,
    borderColor: "#f0c28b",
  },

  suggestTitle: {
    color: "#f57c00",
    marginBottom: 5,
  },

  section: {
    marginHorizontal: 16,
    fontSize: 16,
    fontWeight: "bold",
  },

  sub: {
    marginHorizontal: 16,
    color: "#777",
    marginBottom: 10,
  },

  card: {
    backgroundColor: "#fff",
    marginHorizontal: 16,
    marginBottom: 10,
    padding: 16,
    borderRadius: 16,
    flexDirection: "row",
    justifyContent: "space-between",
  },

  bold: { fontWeight: "bold" },
  gray: { color: "#777" },

  button: {
    marginTop: 10,
    backgroundColor: "#111",
    padding: 10,
    borderRadius: 20,
    alignSelf: "flex-start",
  },

  buttonText: { color: "#fff" },
});