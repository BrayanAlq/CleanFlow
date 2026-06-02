import { useEffect, useState, useRef, useCallback, useContext } from "react";
import {
  View, Text, StyleSheet, TextInput,
  TouchableOpacity, FlatList,
} from "react-native";
import MapView, { Marker, Polyline } from "../components/MapView";
import { Ionicons } from "@expo/vector-icons";
import * as Location from "expo-location";
import { AuthContext } from "../context/AuthContext";
import { connect, disconnect, subscribe, publish } from "../services/websocket";
import api from "../services/api";

const USER_POSITION = { latitude: -12.084, longitude: -77.0235 };

const TRUCK_WAYPOINTS = [
  { latitude: -12.088, longitude: -77.024 },
  { latitude: -12.088, longitude: -77.022 },
  { latitude: -12.088, longitude: -77.02 },
  { latitude: -12.088, longitude: -77.018 },
  { latitude: -12.0865, longitude: -77.018 },
  { latitude: -12.0865, longitude: -77.02 },
  { latitude: -12.0865, longitude: -77.022 },
  { latitude: -12.0865, longitude: -77.024 },
  { latitude: -12.085, longitude: -77.024 },
  { latitude: -12.085, longitude: -77.022 },
  { latitude: -12.085, longitude: -77.02 },
  { latitude: -12.085, longitude: -77.018 },
  { latitude: -12.0835, longitude: -77.018 },
  { latitude: -12.0835, longitude: -77.02 },
  { latitude: -12.0835, longitude: -77.022 },
  { latitude: -12.0835, longitude: -77.024 },
  { latitude: -12.082, longitude: -77.024 },
  { latitude: -12.082, longitude: -77.022 },
  { latitude: -12.082, longitude: -77.02 },
  { latitude: -12.082, longitude: -77.018 },
  { latitude: -12.0805, longitude: -77.018 },
  { latitude: -12.0805, longitude: -77.02 },
  { latitude: -12.0805, longitude: -77.022 },
  { latitude: -12.0805, longitude: -77.024 },
  { latitude: -12.079, longitude: -77.024 },
  { latitude: -12.079, longitude: -77.022 },
  { latitude: -12.079, longitude: -77.02 },
  { latitude: -12.079, longitude: -77.018 },
  { latitude: -12.0775, longitude: -77.018 },
  { latitude: -12.0775, longitude: -77.02 },
  { latitude: -12.0775, longitude: -77.022 },
  { latitude: -12.0775, longitude: -77.024 },
  { latitude: -12.076, longitude: -77.024 },
  { latitude: -12.076, longitude: -77.022 },
  { latitude: -12.076, longitude: -77.02 },
  { latitude: -12.076, longitude: -77.018 },
];

const FALLBACK_BINS = [
  { id: "1", name: "Parque H. Unanue", percent: 18, status: "Disponible", type: "Reciclable", latitude: -12.0876, longitude: -77.0232 },
  { id: "2", name: "Parque F. Carbajal", percent: 28, status: "Disponible", type: "General", latitude: -12.0858, longitude: -77.0227 },
  { id: "3", name: "Parque S. Bernales", percent: 64, status: "Disponible", type: "Reciclable", latitude: -12.0834, longitude: -77.0227 },
  { id: "4", name: "I.E. V. Andres Belaunde", percent: 88, status: "Lleno", type: "General", latitude: -12.085, longitude: -77.0204 },
  { id: "5", name: "Parque F. Pinglo", percent: 92, status: "Lleno", type: "Orgánica", latitude: -12.0836, longitude: -77.0202 },
];

const TYPE_MAP = { ORGANIC: "Orgánica", RECYCLABLE: "Reciclable", GENERAL: "General" };

function containerToUI(c) {
  const fill = c.last_metric?.filling_level;
  const lvl = fill != null ? Math.round(fill * 100) : ((c.id * 19 + 7) % 97) + 1;
  return {
    id: String(c.id),
    name: c.name || c.address_name || "",
    percent: lvl,
    status: lvl >= 85 ? "Lleno" : "Disponible",
    type: TYPE_MAP[c.type] || c.type || ((c.id % 3 === 0) ? "Orgánica" : (c.id % 3 === 1) ? "Reciclable" : "General"),
    latitude: c.latitude,
    longitude: c.longitude,
  };
}

const getColor = (percent) => {
  if (percent >= 85) return "#e53935";
  if (percent >= 60) return "#f9a825";
  return "#2e7d32";
};

export default function CercanosScreen() {
  const { token } = useContext(AuthContext);
  const [bins, setBins] = useState(FALLBACK_BINS);
  const [filteredBins, setFilteredBins] = useState(FALLBACK_BINS);
  const [driverLocation, setDriverLocation] = useState(TRUCK_WAYPOINTS[0]);
  const [routeCoords, setRouteCoords] = useState(null);
  const [searchText, setSearchText] = useState("");
  const [region, setRegion] = useState({
    latitude: -12.083, longitude: -77.023,
    latitudeDelta: 0.02, longitudeDelta: 0.02,
  });
  const mapRef = useRef(null);
  const wsConnected = useRef(false);

  Location.requestForegroundPermissionsAsync();

  // Search filter
  useEffect(() => {
    const q = searchText.toLowerCase().trim();
    if (!q) {
      setFilteredBins(bins);
      return;
    }
    setFilteredBins(
      bins.filter(
        (b) => b.name.toLowerCase().includes(q) || (b.type && b.type.toLowerCase().includes(q)),
      ),
    );
  }, [searchText, bins]);

  // Fetch containers from API
  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const res = await api.get("/container/viewport", {
          params: {
            north: region.latitude + 0.02,
            south: region.latitude - 0.02,
            east: region.longitude + 0.02,
            west: region.longitude - 0.02,
          },
        });
        if (!cancelled && Array.isArray(res.data) && res.data.length > 0) {
          setBins(res.data.map(containerToUI));
        }
      } catch {}
    })();
    return () => { cancelled = true; };
  }, []);

  // WebSocket connection for driver tracking
  useEffect(() => {
    if (!token || wsConnected.current) return;
    wsConnected.current = true;

    connect(token, (client) => {
      subscribe("/user/queue/drivers", (data) => {
        if (data.latitude && data.longitude) {
          setDriverLocation({ latitude: data.latitude, longitude: data.longitude });
        }
      });

      publish("/app/viewport.update", {
        north: region.latitude + region.latitudeDelta / 2,
        south: region.latitude - region.latitudeDelta / 2,
        east: region.longitude + region.longitudeDelta / 2,
        west: region.longitude - region.longitudeDelta / 2,
      });
    });

    return () => disconnect();
  }, [token]);

  // Simulated truck movement (fallback when no WS data)
  useEffect(() => {
    let idx = 0;
    const interval = setInterval(() => {
      idx = (idx + 1) % TRUCK_WAYPOINTS.length;
      setDriverLocation(TRUCK_WAYPOINTS[idx]);
      setBins((prev) =>
        prev.map((b) => {
          if (b.percent === 0) return b;
          const dist =
            Math.abs(TRUCK_WAYPOINTS[idx].latitude - b.latitude) +
            Math.abs(TRUCK_WAYPOINTS[idx].longitude - b.longitude);
          if (dist < 0.0015) return { ...b, percent: 0, status: "Recolectado" };
          return b;
        }),
      );
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  const isVisited = (bin) => bin.percent === 0;

  const focusOnContainer = (lat, lng) => {
    setRegion({ latitude: lat, longitude: lng, latitudeDelta: 0.005, longitudeDelta: 0.005 });
  };

  const bestBin = bins.reduce((prev, curr) =>
    Number(curr.percent) < Number(prev.percent) ? curr : prev,
  );

  const zoomIn = () => {
    setRegion((prev) => ({
      ...prev,
      latitudeDelta: prev.latitudeDelta / 2,
      longitudeDelta: prev.longitudeDelta / 2,
    }));
  };

  const zoomOut = () => {
    setRegion((prev) => ({
      ...prev,
      latitudeDelta: prev.latitudeDelta * 2,
      longitudeDelta: prev.longitudeDelta * 2,
    }));
  };

  const renderItem = useCallback(
    ({ item }) => (
      <TouchableOpacity
        style={styles.card}
        activeOpacity={0.7}
        onPress={() => focusOnContainer(item.latitude, item.longitude)}
      >
        <View>
          <Text style={styles.bold}>{item.name}</Text>
          <Text style={styles.gray}>{item.type}</Text>
        </View>
        <View style={{ alignItems: "flex-end" }}>
          <Text style={styles.bold}>{item.percent}%</Text>
          <Text style={{ color: getColor(item.percent) }}>{item.status}</Text>
        </View>
      </TouchableOpacity>
    ),
    [],
  );

  const listHeader = () => (
    <Text style={styles.sub}>{filteredBins.length} contenedores cercanos</Text>
  );

  return (
    <View style={styles.container}>
      <View style={styles.mapWrapper}>
        <MapView
          ref={mapRef}
          style={styles.map}
          region={region}
          onRegionChangeComplete={setRegion}
        >
          <Marker
            coordinate={USER_POSITION}
            title="Tu ubicacion"
            anchor={{ x: 0.5, y: 0.5 }}
          >
            <View style={styles.userMarker}>
              <View style={styles.userDot} />
            </View>
          </Marker>

          <Marker
            coordinate={driverLocation}
            title="Camión recolector"
            anchor={{ x: 0.5, y: 0.5 }}
          >
            <View style={styles.truckMarker}>
              <Text style={{ fontSize: 26 }}>🚛</Text>
            </View>
          </Marker>

          {routeCoords && (
            <Polyline coordinates={routeCoords} strokeWidth={4} strokeColor="#2e7d32" />
          )}

          {filteredBins.map((bin) => {
            const color = isVisited(bin) ? "#999" : getColor(bin.percent);
            return (
              <Marker
                key={bin.id}
                coordinate={{ latitude: bin.latitude, longitude: bin.longitude }}
                title={bin.name}
                description={`${bin.percent}% - ${bin.status}`}
                anchor={{ x: 0.5, y: 1 }}
              >
                <View style={{ alignItems: "center" }}>
                  <View style={[styles.bubble, { backgroundColor: color }]}>
                    <Text style={styles.bubbleText}>{bin.percent}%</Text>
                  </View>
                  <View style={[styles.arrow, { borderTopColor: color }]} />
                </View>
              </Marker>
            );
          })}
        </MapView>

        <View style={styles.zoomControls}>
          <TouchableOpacity style={styles.zoomBtn} onPress={zoomIn} activeOpacity={0.6}>
            <Text style={styles.zoomText}>+</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.zoomBtn} onPress={zoomOut} activeOpacity={0.6}>
            <Text style={styles.zoomText}>-</Text>
          </TouchableOpacity>
        </View>
      </View>

      <View style={styles.suggestion}>
        <Text style={styles.suggestTitle}>Sugerencia</Text>
        <Text style={styles.bold}>
          El tacho de {bins.find((b) => b.percent >= 85)?.name} esta lleno
        </Text>
        <Text style={styles.gray}>
          Ve a {bestBin.name} ({bestBin.percent}% disponible)
        </Text>
        <TouchableOpacity
          style={styles.button}
          activeOpacity={0.7}
          onPress={() => focusOnContainer(bestBin.latitude, bestBin.longitude)}
        >
          <Text style={styles.buttonText}>Como llegar</Text>
        </TouchableOpacity>
      </View>

      <Text style={styles.section}>En tu cuadra</Text>

      <View style={styles.search}>
        <Ionicons name="search" size={18} color="#999" />
        <TextInput
          placeholder="Buscar dirección"
          style={styles.searchInput}
          value={searchText}
          onChangeText={setSearchText}
        />
        {searchText.length > 0 && (
          <TouchableOpacity onPress={() => setSearchText("")} activeOpacity={0.7}>
            <Ionicons name="close-circle" size={18} color="#bbb" />
          </TouchableOpacity>
        )}
      </View>

      <FlatList
        data={filteredBins}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        ListHeaderComponent={listHeader}
        contentContainerStyle={styles.listContent}
        showsVerticalScrollIndicator={false}
        style={{ flex: 1 }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#f2f2f2" },
  mapWrapper: { marginHorizontal: 16, marginTop: 16, borderRadius: 20, overflow: "hidden" },
  map: { height: 300 },
  search: {
    flexDirection: "row", alignItems: "center",
    marginHorizontal: 16, marginTop: 6, marginBottom: 6,
    backgroundColor: "#fff", paddingHorizontal: 14,
    borderRadius: 14, height: 44,
  },
  searchInput: { flex: 1, fontSize: 15, marginLeft: 8 },
  listContent: { paddingBottom: 30 },
  zoomControls: { position: "absolute", right: 10, bottom: 10, gap: 6 },
  zoomBtn: {
    width: 36, height: 36, borderRadius: 8, backgroundColor: "#fff",
    justifyContent: "center", alignItems: "center",
    elevation: 4, shadowColor: "#000", shadowOpacity: 0.15, shadowRadius: 4,
  },
  zoomText: { fontSize: 20, fontWeight: "600", color: "#333" },
  bubble: {
    paddingHorizontal: 8, paddingVertical: 4, borderRadius: 12,
    minWidth: 38, alignItems: "center",
  },
  bubbleText: { color: "#fff", fontWeight: "bold", fontSize: 12 },
  arrow: {
    width: 0, height: 0,
    borderLeftWidth: 5, borderRightWidth: 5, borderTopWidth: 6,
    borderLeftColor: "transparent", borderRightColor: "transparent",
  },
  userMarker: {
    width: 22, height: 22, borderRadius: 11, backgroundColor: "#fff",
    borderWidth: 3, borderColor: "#1976d2",
    justifyContent: "center", alignItems: "center",
  },
  userDot: { width: 10, height: 10, borderRadius: 5, backgroundColor: "#1976d2" },
  truckMarker: { width: 40, height: 40, justifyContent: "center", alignItems: "center" },
  suggestion: {
    margin: 16, backgroundColor: "#f6efe6", padding: 16, borderRadius: 16,
    borderWidth: 1, borderColor: "#f0c28b",
    elevation: 1, shadowColor: "#f57c00", shadowOpacity: 0.08,
    shadowRadius: 8, shadowOffset: { width: 0, height: 2 },
  },
  suggestTitle: { color: "#f57c00", marginBottom: 5 },
  section: { marginHorizontal: 16, fontSize: 16, fontWeight: "bold", marginBottom: 6 },
  sub: { marginHorizontal: 16, color: "#777", marginBottom: 10 },
  card: {
    backgroundColor: "#fff", marginHorizontal: 16, marginBottom: 10,
    padding: 16, borderRadius: 16, flexDirection: "row",
    justifyContent: "space-between",
    elevation: 1, shadowColor: "#000", shadowOpacity: 0.04,
    shadowRadius: 4, shadowOffset: { width: 0, height: 1 },
  },
  bold: { fontWeight: "bold" },
  gray: { color: "#777" },
  button: {
    marginTop: 10, backgroundColor: "#111", padding: 10, borderRadius: 20,
    alignSelf: "flex-start",
  },
  buttonText: { color: "#fff" },
});
