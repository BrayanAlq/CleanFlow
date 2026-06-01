import { useEffect, useState, useRef, useContext } from "react";
import {
  View, Text, StyleSheet, ScrollView, TouchableOpacity,
  Linking, ActivityIndicator, Alert,
} from "react-native";
import MapView, { Marker, Polyline } from "react-native-maps";
import * as Location from "expo-location";
import { AuthContext } from "../context/AuthContext";
import { connect, disconnect, publish, isConnected } from "../services/websocket";
import api from "../services/api";
import { getColor } from "../data/mock";

export default function RutaScreen() {
  const { token } = useContext(AuthContext);
  const [location, setLocation] = useState(null);
  const [containers, setContainers] = useState([]);
  const [driverLocation, setDriverLocation] = useState(null);
  const [routeCoords, setRouteCoords] = useState([]);
  const [routeId, setRouteId] = useState(null);
  const [routeStarted, setRouteStarted] = useState(false);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);
  const wsConnected = useRef(false);
  const watchRef = useRef(null);
  const intervalRef = useRef(null);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== "granted") {
        setLoading(false);
        return;
      }
      let loc = await Location.getCurrentPositionAsync({});
      setLocation(loc.coords);
      const start = { latitude: loc.coords.latitude, longitude: loc.coords.longitude };
      setDriverLocation(start);
      setRouteCoords([start]);

      try {
        const res = await api.get("/driver/scheduled-route");
        if (res.data && res.data.generated_containers) {
          setContainers(res.data.generated_containers.map((gc) => gc.container));
        }
      } catch (e) {}
      setLoading(false);
    })();
  }, []);

  const startRoute = async () => {
    setActionLoading(true);
    try {
      const res = await api.post("/route");
      const rid = res.data.id;
      setRouteId(rid);
      setRouteStarted(true);

      if (!wsConnected.current) {
        connect(token);
        wsConnected.current = true;
      }

      watchRef.current = await Location.watchPositionAsync(
        { distanceInterval: 10, timeInterval: 5000 },
        (pos) => {
          const { latitude, longitude } = pos.coords;
          setDriverLocation({ latitude, longitude });
          setRouteCoords((prev) => [...prev, { latitude, longitude }]);
          if (isConnected()) {
            publish("/app/driver.location", { latitude, longitude });
          }
        }
      );

      Alert.alert("Ruta iniciada", `Ruta #${rid} en progreso`);
    } catch (e) {
      Alert.alert("Error", "No se pudo iniciar la ruta");
    } finally {
      setActionLoading(false);
    }
  };

  const finishRoute = async () => {
    if (!routeId) return;
    setActionLoading(true);
    try {
      await api.patch(`/route/${routeId}`);

      if (watchRef.current) watchRef.current.remove();
      if (intervalRef.current) clearInterval(intervalRef.current);
      wsConnected.current = false;
      disconnect();

      setRouteStarted(false);
      setRouteId(null);
      Alert.alert("Ruta finalizada", "La ruta se ha completado");
    } catch (e) {
      Alert.alert("Error", "No se pudo finalizar la ruta");
    } finally {
      setActionLoading(false);
    }
  };

  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=driving`;
    Linking.openURL(url).catch(() => alert("No se pudo abrir el mapa"));
  };

  if (loading) {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <ActivityIndicator size="large" color="#2e7d32" />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <ScrollView>
        <Text style={styles.header}>Mi ruta</Text>

        <MapView
          style={styles.map}
          region={
            driverLocation && {
              latitude: driverLocation.latitude,
              longitude: driverLocation.longitude,
              latitudeDelta: 0.02,
              longitudeDelta: 0.02,
            }
          }
          initialRegion={{
            latitude: location?.latitude || -12.0464,
            longitude: location?.longitude || -77.0428,
            latitudeDelta: 0.05,
            longitudeDelta: 0.05,
          }}
          showsUserLocation
        >
          {driverLocation && (
            <Marker coordinate={driverLocation} title="Tu ubicación">
              <Text style={styles.markerIcon}>🚛</Text>
            </Marker>
          )}

          {routeCoords.length > 1 && (
            <Polyline coordinates={routeCoords} strokeWidth={4} strokeColor="#2e7d32" />
          )}

          {containers.map((bin) => (
            <Marker
              key={bin.id}
              coordinate={{ latitude: bin.latitude, longitude: bin.longitude }}
              title={bin.name}
            >
              <View style={[styles.binMarker, { backgroundColor: getColor(bin.filling_level || 50) }]}>
                <Text style={styles.binMarkerText}>{bin.filling_level || "?"}</Text>
              </View>
            </Marker>
          ))}
        </MapView>

        {!routeStarted ? (
          <TouchableOpacity
            style={[styles.startButton, actionLoading && { opacity: 0.6 }]}
            onPress={startRoute} disabled={actionLoading}
          >
            <Text style={styles.buttonText}>
              {actionLoading ? "Iniciando..." : "Iniciar ruta"}
            </Text>
          </TouchableOpacity>
        ) : (
          <TouchableOpacity
            style={[styles.finishButton, actionLoading && { opacity: 0.6 }]}
            onPress={finishRoute} disabled={actionLoading}
          >
            <Text style={styles.buttonText}>
              {actionLoading ? "Finalizando..." : "Finalizar ruta"}
            </Text>
          </TouchableOpacity>
        )}

        {routeStarted && (
          <View style={styles.statusBadge}>
            <Text style={styles.statusText}>Ruta activa #{routeId}</Text>
          </View>
        )}

        <Text style={styles.section}>Tachos asignados</Text>
        <Text style={styles.sub}>{containers.length} contenedores</Text>

        {containers.map((item) => (
          <TouchableOpacity
            key={item.id}
            style={styles.card}
            onPress={() => openDirections(item.latitude, item.longitude)}
          >
            <View style={{ flex: 1 }}>
              <Text style={styles.bold}>{item.name}</Text>
              <Text style={styles.gray}>{item.address_name || ""}</Text>
            </View>
          </TouchableOpacity>
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f2f2f2" },
  header: { fontSize: 22, fontWeight: "bold", margin: 16, marginBottom: 0 },
  map: { height: 300, margin: 16, borderRadius: 20 },
  markerIcon: { fontSize: 22 },
  binMarker: {
    width: 40, height: 40, borderRadius: 20,
    justifyContent: "center", alignItems: "center",
  },
  binMarkerText: { color: "#fff", fontWeight: "bold" },
  startButton: {
    margin: 16, marginTop: 0, backgroundColor: "#2e7d32",
    padding: 16, borderRadius: 30, alignItems: "center",
  },
  finishButton: {
    margin: 16, marginTop: 0, backgroundColor: "#e53935",
    padding: 16, borderRadius: 30, alignItems: "center",
  },
  buttonText: { color: "#fff", fontWeight: "bold", fontSize: 16 },
  statusBadge: {
    marginHorizontal: 16, marginBottom: 16,
    backgroundColor: "#e8f5e9", padding: 12, borderRadius: 12,
    alignItems: "center",
  },
  statusText: { color: "#2e7d32", fontWeight: "600" },
  section: { marginHorizontal: 16, fontSize: 16, fontWeight: "bold" },
  sub: { marginHorizontal: 16, color: "#777", marginBottom: 10 },
  card: {
    backgroundColor: "#fff", marginHorizontal: 16, marginBottom: 10,
    padding: 16, borderRadius: 16, flexDirection: "row",
    justifyContent: "space-between",
  },
  bold: { fontWeight: "bold" },
  gray: { color: "#777" },
});
