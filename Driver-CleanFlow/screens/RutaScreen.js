import { useEffect, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Linking,
} from "react-native";
import MapView, { Marker, Polyline } from "react-native-maps";
import * as Location from "expo-location";
import { BINS, INITIAL_DRIVER_LOCATION, getColor } from "../data/mock";

export default function RutaScreen() {
  const [location, setLocation] = useState(null);
  const [driverLocation, setDriverLocation] = useState(INITIAL_DRIVER_LOCATION);
  const [route, setRoute] = useState([]);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== "granted") return;
      let loc = await Location.getCurrentPositionAsync({});
      setLocation(loc.coords);
    })();
  }, []);

  useEffect(() => {
    const interval = setInterval(() => {
      setDriverLocation((prev) => ({
        latitude: prev.latitude + 0.0003,
        longitude: prev.longitude + 0.0003,
      }));
    }, 3000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    setRoute((prev) => [...prev, driverLocation]);
  }, [driverLocation]);

  const pending = BINS.filter((b) => !b.collected);
  const nextBin = pending.length > 0 ? pending[0] : null;

  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=driving`;
    Linking.openURL(url).catch(() => alert("No se pudo abrir el mapa"));
  };

  return (
    <View style={styles.container}>
      <ScrollView>
        <Text style={styles.header}>Mi ruta</Text>

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
            latitude: INITIAL_DRIVER_LOCATION.latitude,
            longitude: INITIAL_DRIVER_LOCATION.longitude,
            latitudeDelta: 0.05,
            longitudeDelta: 0.05,
          }}
          showsUserLocation
        >
          <Marker coordinate={driverLocation} title="Tu ubicación">
            <Text style={styles.markerIcon}>🚛</Text>
          </Marker>

          <Polyline
            coordinates={route}
            strokeWidth={4}
            strokeColor="#2e7d32"
          />

          {BINS.map((bin) => (
            <Marker
              key={bin.id}
              coordinate={{
                latitude: bin.latitude,
                longitude: bin.longitude,
              }}
              title={bin.name}
              description={`${bin.percent}% - ${bin.collected ? "Recolectado" : bin.status}`}
            >
              <View
                style={[
                  styles.binMarker,
                  {
                    backgroundColor: bin.collected
                      ? "#999"
                      : getColor(bin.percent),
                  },
                ]}
              >
                <Text style={styles.binMarkerText}>{bin.percent}</Text>
              </View>
            </Marker>
          ))}
        </MapView>

        {nextBin && (
          <View style={styles.suggestion}>
            <Text style={styles.suggestTitle}>Siguiente tacho</Text>
            <Text style={styles.bold}>{nextBin.name}</Text>
            <Text style={styles.gray}>
              {nextBin.percent}% · {nextBin.type}
            </Text>
            <TouchableOpacity
              style={styles.button}
              onPress={() => openDirections(nextBin.latitude, nextBin.longitude)}
            >
              <Text style={styles.buttonText}>Cómo llegar</Text>
            </TouchableOpacity>
          </View>
        )}

        <Text style={styles.section}>Tachos asignados</Text>
        <Text style={styles.sub}>
          {BINS.filter((b) => !b.collected).length} pendientes ·{" "}
          {BINS.filter((b) => b.collected).length} recolectados
        </Text>

        {BINS.map((item) => (
          <TouchableOpacity
            key={item.id}
            style={styles.card}
            onPress={() => openDirections(item.latitude, item.longitude)}
          >
            <View style={{ flex: 1 }}>
              <Text style={styles.bold}>{item.name}</Text>
              <Text style={styles.gray}>{item.type}</Text>
            </View>
            <View style={{ alignItems: "flex-end" }}>
              <Text style={styles.bold}>{item.percent}%</Text>
              <Text
                style={{
                  color: item.collected ? "#999" : getColor(item.percent),
                }}
              >
                {item.collected ? "Recolectado" : item.status}
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
  header: {
    fontSize: 22,
    fontWeight: "bold",
    margin: 16,
    marginBottom: 0,
  },
  map: { height: 300, margin: 16, borderRadius: 20 },
  markerIcon: { fontSize: 22 },
  binMarker: {
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: "center",
    alignItems: "center",
  },
  binMarkerText: { color: "#fff", fontWeight: "bold" },
  suggestion: {
    margin: 16,
    marginTop: 0,
    backgroundColor: "#e8f5e9",
    padding: 16,
    borderRadius: 16,
    borderWidth: 1,
    borderColor: "#a5d6a7",
  },
  suggestTitle: { color: "#2e7d32", marginBottom: 5, fontWeight: "600" },
  section: { marginHorizontal: 16, fontSize: 16, fontWeight: "bold" },
  sub: { marginHorizontal: 16, color: "#777", marginBottom: 10 },
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
    backgroundColor: "#2e7d32",
    padding: 10,
    borderRadius: 20,
    alignSelf: "flex-start",
  },
  buttonText: { color: "#fff" },
});
