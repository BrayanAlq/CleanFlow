# CleanFlow — AGENTS.md

## Frontend-CleanFlow (Expo / React Native)

- **Entrypoint**: `Frontend-CleanFlow/index.js` → `App.js`
- **Framework**: Expo SDK 54, React Native 0.81.5, React 19.1.0
- **Real API calls** to `https://cleanflow.deyvigo.online` (not mocked)
- **Plain JavaScript** — no TypeScript anywhere
- **Commands** (from `Frontend-CleanFlow/`):
  ```
  npm start          # expo start
  npm run android    # expo start --android
  npm run ios        # expo start --ios
  npm run web        # expo start --web
  ```
- **No lint, test, or typecheck scripts exist** — do not attempt to run them
- UI language: Spanish
- 4 bottom tabs: `Inicio` (Home), `Cercanos` (Map), `Reportar` (Report), `Perfil` (Profile)
- `CercanosScreen` uses `expo-location` (permission required) and `react-native-maps` with real container data from backend
- `@react-native-async-storage/async-storage` must be **v1.23.1** (v3 breaks on Expo SDK 54)
- Web map: `components/MapView.web.js` mocks `react-native-maps` (native-only module)
- WebSocket (`services/websocket.js`) connects to `wss://cleanflow.deyvigo.online/ws-device` — fails gracefully if server doesn't accept WS
- Login clears `global.jwtToken` before request to prevent stale-token rejection

## Firmware-CleanFlow (ESP32 / Arduino)

- **Entrypoint**: `Firmware-CleanFlow/CleanFlow.ino`
- **Sensors**: HC-SR04 (ultrasonic), MQ-135 (gas/NH3), SW-520D (tilt)
- **Calibration persisted** via `Preferences.h` to flash (not runtime-only)
- **Serial commands** (115200 baud): `c` = calibrate, `p` = production mode, `r` = reset prefs, `s` = status
- **Demo warmup**: MQ-135 is 20 s (`MQ135_WARMUP_MS`). Change to 1200000 (20 min) for production
- **WiFi**: credentials in `secrets.h` (gitignored). Copy `secrets_example.h` → `secrets.h` with real SSID/password. Non-blocking reconnect with backoff
- **Server URL**: hardcoded (`webhook.site` — replace for production)
- **Device ID**: hardcoded as `"BIN-001"` in the POST JSON
- **SensorsTest.ino**: standalone test sketch (9600 baud, no WiFi)
- No `platformio.ini` committed — uses Arduino framework (IDE or CLI)
