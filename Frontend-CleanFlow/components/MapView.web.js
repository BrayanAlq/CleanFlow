import { View, Text, StyleSheet } from "react-native";

export function MapView({ style, children, ...props }) {
  return (
    <View style={[styles.placeholder, style]}>
      <Text style={styles.text}>Mapa no disponible en web</Text>
    </View>
  );
}

export function Marker() {
  return null;
}

export function Polyline() {
  return null;
}

export default MapView;

const styles = StyleSheet.create({
  placeholder: {
    backgroundColor: "#e0e0e0",
    justifyContent: "center",
    alignItems: "center",
  },
  text: { color: "#666", fontSize: 14 },
});
