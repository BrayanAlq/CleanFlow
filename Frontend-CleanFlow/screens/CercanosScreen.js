import {
  View, Text, StyleSheet, TextInput, ScrollView,
  TouchableOpacity, Linking, ActivityIndicator,
} from "react-native";
import MapView, { Marker } from "react-native-maps";
import * as Location from "expo-location";
import { useEffect, useState, useRef, useContext } from "react";
import api from "../services/api";
import { connect, disconnect, subscribe, publish } from "../services/websocket";
import { AuthContext } from "../context/AuthContext";
import { getColor } from "../data/mock";

export default function CercanosScreen() {
  const { token } = useContext(AuthContext);
  const [location, setLocation] = useState(null);
  const [containers, setContainers] = useState([]);
  const [drivers, setDrivers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [region, setRegion] = useState(null);
  const wsConnected = useRef(false);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== "granted") return;
      let loc = await Location.getCurrentPositionAsync({});
      setLocation(loc.coords);
      setRegion({
        latitude: loc.coords.latitude,
        longitude: loc.coords.longitude,
        latitudeDelta: 0.05,
        longitudeDelta: 0.05,
      });
    })();
  }, []);

  useEffect(() => {
    if (!region) return;

    const fetchContainers = async () => {
      try {
        const res = await api.get("/container/viewport", {
          params: {
            north: region.latitude + region.latitudeDelta / 2,
            south: region.latitude - region.latitudeDelta / 2,
            east: region.longitude + region.longitudeDelta / 2,
            west: region.longitude - region.longitudeDelta / 2,
          },
        });
        setContainers(res.data);
      } catch (e) {
      } finally {
        setLoading(false);
      }
    };

    fetchContainers();
  }, [region]);

  useEffect(() => {
    if (!token || wsConnected.current) return;
    wsConnected.current = true;

    connect(token, (client) => {
      subscribe("/user/queue/drivers", (data) => {
        setDrivers((prev) => {
          const idx = prev.findIndex((d) => d.driver_id === data.driver_id);
          if (idx >= 0) {
            const updated = [...prev];
            updated[idx] = data;
            return updated;
          }
          return [...prev, data];
        });
      });

      if (region) {
        publish("/app/viewport.update", {
          north: region.latitude + region.latitudeDelta / 2,
          south: region.latitude - region.latitudeDelta / 2,
          east: region.longitude + region.longitudeDelta / 2,
          west: region.longitude - region.longitudeDelta / 2,
        });
      }
    });

    return () => disconnect();
  }, [token]);

  useEffect(() => {
    if (!region || !wsConnected.current) return;
    publish("/app/viewport.update", {
      north: region.latitude + region.latitudeDelta / 2,
      south: region.latitude - region.latitudeDelta / 2,
      east: region.longitude + region.longitudeDelta / 2,
      west: region.longitude - region.longitudeDelta / 2,
    });
  }, [region]);

  const openDirections = (lat, lng) => {
    const url = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=walking`;
    Linking.openURL(url).catch(() => alert("No se pudo abrir el mapa"));
  };

  return (
    <View style={styles.container}>
      <ScrollView>
        <View style={styles.search}>
          <TextInput placeholder="Buscar dirección" />
        </View>

        <MapView
          style={styles.map}
          region={region}
          initialRegion={{
            latitude: -12.0464, longitude: -77.0428,
            latitudeDelta: 0.05, longitudeDelta: 0.05,
          }}
          showsUserLocation
          onRegionChangeComplete={(r) => setRegion(r)}
        >
          {drivers.map((d, i) => (
            <Marker
              key={`driver-${d.driver_id || i}`}
              coordinate={{ latitude: d.latitude, longitude: d.longitude }}
              title="Conductor"
            >
              <Text style={{ fontSize: 22 }}>🚛</Text>
            </Marker>
          ))}

          {containers.map((c) => (
            <Marker
              key={c.id}
              coordinate={{ latitude: c.latitude, longitude: c.longitude }}
              title={c.name}
              description={c.address_name || ""}
            >
              <View style={[styles.marker, { backgroundColor: getColor(50) }]}>
                <Text style={styles.markerText}>🗑️</Text>
              </View>
            </Marker>
          ))}
        </MapView>

        <Text style={styles.section}>Contenedores cercanos</Text>
        <Text style={styles.sub}>
          {loading ? "Cargando..." : `${containers.length} contenedores`}
        </Text>

        {loading ? (
          <ActivityIndicator style={{ margin: 20 }} color="#2e7d32" />
        ) : (
          containers.map((c) => (
            <TouchableOpacity
              key={c.id}
              style={styles.card}
              onPress={() => openDirections(c.latitude, c.longitude)}
            >
              <View>
                <Text style={styles.bold}>{c.name}</Text>
                <Text style={styles.gray}>{c.address_name || ""}</Text>
              </View>
            </TouchableOpacity>
          ))
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f2f2f2" },
  search: { margin: 16, backgroundColor: "#fff", padding: 12, borderRadius: 20 },
  map: { height: 300, marginHorizontal: 16, borderRadius: 20 },
  marker: {
    width: 40, height: 40, borderRadius: 20,
    justifyContent: "center", alignItems: "center",
  },
  markerText: { color: "#fff", fontWeight: "bold" },
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
