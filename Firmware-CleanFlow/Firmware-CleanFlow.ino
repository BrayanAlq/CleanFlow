// =============================================================
//  CleanFlow - ESP32
// =============================================================

#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <Preferences.h>
#include <MQUnifiedsensor.h>
#include "secrets.h"

// --- Configuración del Backend ---
const char* wsPath = "/ws-device";
const unsigned long METRIC_INTERVAL_MS = 3000;
const unsigned long CHECK_CONTAINER_INTERVAL_MS = 6000;

// --- Pines Hardware ---
const int trigPin        = 22;
const int echoPin        = 23;
const int inclinacionPin = 15;
#define   pinMQ            34

// --- Configuración MQ-135 ---
#define placa                 "ESP-32"
#define Voltage_Resolution    3.3
#define TIPO_MQ135            "MQ-135"
#define ADC_Bit_Resolution    12
#define RatioMQ135CleanAir    3.6
#define MQ135_WARMUP_MS       20000UL   // 20 seg demo | cambiar a 1200000UL (20 min) en producción real

// --- Configuración WiFi ---
#define WIFI_MAX_RETRIES      10        // Intentos máximos antes de rendirse temporalmente
#define WIFI_RETRY_DELAY_MS   3000      // Espera entre reintentos
#define WIFI_BACKOFF_MS       60000UL   // Espera larga tras agotar intentos

// --- Variables Globales ---
float    distanciaAct   = 0;
float    distanciaMax   = 0;
float    r0_calibrado   = 0;
bool     modoProduccion = false;
bool     mqCalentado    = false;
uint32_t tiempoEncendido = 0;

// --- Reconexión WiFi ---
uint8_t  wifiIntentos    = 0;
uint32_t wifiUltimoIntento = 0;
bool     wifiEnBackoff   = false;
uint32_t wifiBackoffInicio = 0;

// --- WebSocket / STOMP ---
WiFiClientSecure wsClient;
String    deviceApiKey    = "";
String    deviceSecret    = "";
bool      stompConnected  = false;
bool      wsConectado     = false;
uint32_t  ultimoEnvio     = 0;
uint32_t  wsUltimoIntento = 0;
uint32_t  ultimoCheckContainer = 0;

// Instancias
Preferences    preferences;
MQUnifiedsensor MQ135(placa, Voltage_Resolution, ADC_Bit_Resolution, pinMQ, TIPO_MQ135);

// --- Prototipos ---
float  calcularDistanciaCm();
float  calcularLlenado();
bool   estaInclinado();
void   ejecutarCalibracionCompleta();
void   reconectarWiFi();
void   enviarDatos(float nivel, float gas, bool inclinado);
void   logSerial(const char* nivel, const String& msg);
void   obtenerCredenciales();
void   verificarCambioContenedor();
void   wsConectar();
void   wsLoop();
bool   wsEnviarFrame(const String& data);
String wsGenerarKey();
void   enviarFrameStompConnect();
void   enviarFrameStompSend(const String& body);

void setup() {
  Serial.begin(115200);
  delay(1000);
  tiempoEncendido = millis();

  pinMode(trigPin,        OUTPUT);
  pinMode(echoPin,        INPUT);
  pinMode(inclinacionPin, INPUT_PULLUP);

  // 1. Cargar configuración persistida
  preferences.begin("cleanflow", false);
  distanciaMax   = preferences.getFloat("distMax", 0);
  r0_calibrado   = preferences.getFloat("mqR0",    0);
  modoProduccion = preferences.getBool("enProd",   false);

  // 2. Configurar sensor MQ-135 (curva NH3)
  MQ135.setRegressionMethod(1);
  MQ135.setA(102.2);
  MQ135.setB(-2.473);
  MQ135.setR0(r0_calibrado);
  MQ135.init();

  // 3. Conectar WiFi (intento inicial bloqueante con timeout)
  logSerial("INFO", "Conectando a WiFi...");
  WiFi.begin(ssid, password);
  uint32_t wifiStart = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - wifiStart < 15000) {
    delay(500);
    Serial.print(".");
  }
  //if (WiFi.status() == WL_CONNECTED) {
  //  logSerial("INFO", "WiFi conectado. IP: " + WiFi.localIP().toString());
  //  wifiIntentos = 0;
  //  obtenerCredenciales();
  //  conectarWebSocket();
  //} else {
    //logSerial("WARN", "No se pudo conectar al WiFi. Se reintentará en el loop.");
  //}
  if (WiFi.status() == WL_CONNECTED) {
    logSerial("INFO", "WiFi conectado. IP: " + WiFi.localIP().toString());
    wifiIntentos = 0;
    logSerial("INFO", "Obteniendo credenciales del backend...");
    obtenerCredenciales();
    if (deviceApiKey.length() > 0) {
      logSerial("INFO", "Credenciales OK. Conectando WebSocket...");
      wsConectar();
    } else {
      logSerial("ERROR", "No se obtuvieron credenciales. ¿Backend encendido?");
    }
  } else {
    logSerial("WARN", "No se pudo conectar al WiFi. Se reintentará en el loop.");
  }

  // 4. Lógica de modo de inicio
  if (modoProduccion && r0_calibrado > 0 && distanciaMax > 0) {
    MQ135.setR0(r0_calibrado);
    logSerial("INFO", "MODO PRODUCCION iniciado (valores cargados desde memoria)");
    logSerial("WARN", "Esperando precalentamiento del MQ-135 (" + String(MQ135_WARMUP_MS / 1000) + " seg)...");
  } else {
    modoProduccion = false;
    logSerial("INFO", "MODO CONFIGURACION. Usa 'c' para calibrar o 'p' para producción.");
  }
  
  Serial.println("--- COMANDOS: [c] Calibrar | [p] Producción | [r] Reset | [s] Estado ---");
}

// =============================================================
void loop() {
  uint32_t ahora = millis();

  // ── Mantener WebSocket vivo ─────────────────────────────────
  wsLoop();

  // ── Reconectar si se perdió ─────────────────────────────────
  if (!wsClient.connected() && deviceApiKey.length() > 0 && WiFi.status() == WL_CONNECTED) {
    if (ahora - wsUltimoIntento > 5000) {
      wsUltimoIntento = ahora;
      logSerial("INFO", "Reconectando WebSocket...");
      wsConectar();
    }
  }

  // ── Verificar precalentamiento MQ-135 ──────────────────────
  if (!mqCalentado && (ahora - tiempoEncendido >= MQ135_WARMUP_MS)) {
    mqCalentado = true;
    logSerial("INFO", "MQ-135 precalentado. Lecturas de gas ahora son confiables.");
  }

  // ── Verificar si el contenedor fue reasignado ──────────────
  if (modoProduccion && WiFi.status() == WL_CONNECTED && ahora - ultimoCheckContainer >= CHECK_CONTAINER_INTERVAL_MS) {
    ultimoCheckContainer = ahora;
    verificarCambioContenedor();
  }

  // ── Comandos por Serial ─────────────────────────────────────
  while (Serial.available() > 0) {
    char tecla = Serial.read();

    // Ignorar caracteres de control (enter, retorno de carro, espacios)
    if (tecla == '\r' || tecla == '\n' || tecla == ' ') continue;

    if (tecla == 'c') {
      ejecutarCalibracionCompleta();
    }
    else if (tecla == 'p') {
      if (distanciaMax > 0 && r0_calibrado > 0) {
        modoProduccion = true;
        preferences.putBool("enProd", true);
        logSerial("INFO", "MODO PRODUCCION activado y guardado.");
      } else {
        logSerial("ERROR", "Primero debes calibrar con 'c'.");
      }
    }
    else if (tecla == 'r') {
      logSerial("WARN", "Reseteando configuración guardada...");
      preferences.clear();
      modoProduccion = false;
      distanciaMax   = 0;
      r0_calibrado   = 0;
      MQ135.setR0(r0_calibrado);
      logSerial("INFO", "Reset completo. Reinicia el dispositivo.");
    }
    else if (tecla == 's') {
    Serial.println("\n========================================");
    Serial.println("         ESTADO ACTUAL DEL SISTEMA      ");
    Serial.println("========================================");
    Serial.printf("  distanciaMax   : %.2f cm\n",   distanciaMax);
    Serial.printf("  distanciaAct   : %.2f cm\n",   distanciaAct);
    Serial.printf("  r0_calibrado   : %.4f\n",       r0_calibrado);
    Serial.printf("  modoProduccion : %s\n",          modoProduccion ? "SI" : "NO");
    Serial.printf("  mqCalentado    : %s\n",          mqCalentado    ? "SI" : "NO");
    Serial.printf("  uptime         : %lu seg\n",     millis() / 1000);
    Serial.println("--- Preferences guardadas en flash ---");
    Serial.printf("  distMax (flash): %.2f cm\n",   preferences.getFloat("distMax", 0));
    Serial.printf("  mqR0    (flash): %.4f\n",       preferences.getFloat("mqR0",   0));
    Serial.printf("  enProd  (flash): %s\n",          preferences.getBool("enProd", false) ? "SI" : "NO");
    Serial.println("========================================\n");
    }
    else {
      logSerial("WARN", "Comando desconocido: '" + String(tecla) + "'");
    }
  }

  // ── Envío periódico cada METRIC_INTERVAL_MS ────────────────
  if (ahora - ultimoEnvio >= METRIC_INTERVAL_MS) {
    ultimoEnvio = ahora;

    // ── Lectura de Sensores ─────────────────────────────────────
    distanciaAct    = calcularDistanciaCm();
    MQ135.update();
    float gasPPM    = mqCalentado ? MQ135.readSensor() : -1.0;
    float nivelLlenado = calcularLlenado();
    bool  inclinado = estaInclinado();

    // ── Log de estado ───────────────────────────────────────────
    String modo = modoProduccion ? "[PROD]  " : "[CONFIG]";
    String gasStr = mqCalentado ? String(gasPPM, 2) + " PPM" : "calentando...";
    Serial.printf("%s Nivel: %5.1f%% | Gas: %s | Dist: %.1f cm | Inc: %s | WiFi: %s\n",
      modo.c_str(),
      nivelLlenado,
      gasStr.c_str(),
      distanciaAct,
      inclinado ? "SI" : "NO",
      WiFi.status() == WL_CONNECTED ? "OK" : "X"
    );

    // ── Envío de datos (solo en producción y con MQ calentado) ──
    if (modoProduccion && mqCalentado) {
      enviarDatos(nivelLlenado, gasPPM, inclinado);
    }
  }

  // ── Reconexión WiFi no bloqueante ───────────────────────────
  reconectarWiFi();
}

// =============================================================
//  FUNCIONES
// =============================================================

/**
 * Mide distancia con HC-SR04.
 * Retorna 0 si no hay eco válido (objeto fuera de rango o falla).
 */
float calcularDistanciaCm() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // timeout 25ms ≈ ~4m máximo de rango del HC-SR04
  long duration = pulseIn(echoPin, HIGH, 25000);
  if (duration == 0) return 0;

  float d = duration * 0.0343f / 2.0f;
  // Filtro de rango válido para sensor HC-SR04: 2cm - 400cm
  return (d >= 2.0f && d <= 400.0f) ? d : 0;
}

/**
 * Calcula porcentaje de llenado del tacho.
 * 0% = vacío, 100% = lleno.
 */
float calcularLlenado() {
  if (distanciaMax <= 0 || distanciaAct <= 0) return 0;
  float porcent = ((distanciaMax - distanciaAct) / distanciaMax) * 100.0f;
  return constrain(porcent, 0.0f, 100.0f);
}

/**
 * Retorna true si el sensor de inclinación detecta volcamiento.
 * Sensor de bola: LOW = inclinado (conectado a GND).
 */
bool estaInclinado() {
  return digitalRead(inclinacionPin) == LOW;
}

/**
 * Calibración completa: distancia (tacho vacío) + R0 del MQ-135 (aire limpio).
 * Advertencia: el MQ-135 necesita al menos 20 min encendido para calibración precisa.
 */
void ejecutarCalibracionCompleta() {
  Serial.println("\n========================================");
  Serial.println("       INICIANDO CALIBRACIÓN COMPLETA   ");
  Serial.println("  Condiciones: TACHO VACÍO + AIRE LIMPIO");
  Serial.println("========================================");

  if (!mqCalentado) {
    uint32_t restante = (MQ135_WARMUP_MS - (millis() - tiempoEncendido)) / 1000;
    logSerial("WARN", "MQ-135 aún calentando. Faltan ~" + String(restante) + " seg. La calibración de gas puede ser imprecisa.");
  }

  // ── Calibrar Distancia ──────────────────────────────────────
  Serial.println("\n[1/2] Calibrando sensor ultrasonico...");
  float sumaD = 0;
  int   muestrasValidas = 0;
  for (int i = 0; i < 15; i++) {
    float d = calcularDistanciaCm();
    if (d > 0) {
      sumaD += d;
      muestrasValidas++;
    }
    delay(150);
    Serial.print(".");
  }

  if (muestrasValidas < 5) {
    logSerial("ERROR", "Pocas lecturas válidas del ultrasonico. Verifique conexiones.");
    return;
  }

  distanciaMax = sumaD / (float)muestrasValidas;
  preferences.putFloat("distMax", distanciaMax);
  Serial.printf("\n  Distancia maxima guardada: %.2f cm (%d muestras)\n", distanciaMax, muestrasValidas);

  // ── Calibrar Gas MQ-135 ─────────────────────────────────────
  Serial.println("\n[2/2] Calibrando MQ-135 (R0)...");
  float calcR0 = 0;
  for (int i = 0; i < 15; i++) {
    MQ135.update();
    calcR0 += MQ135.calibrate(RatioMQ135CleanAir);
    delay(300);
    Serial.print(".");
  }
  r0_calibrado = calcR0 / 15.0f;

  if (r0_calibrado <= 0 || isnan(r0_calibrado)) {
    logSerial("ERROR", "R0 inválido. Verifica conexión del MQ-135 y voltaje.");
    return;
  }

  MQ135.setR0(r0_calibrado);
  preferences.putFloat("mqR0", r0_calibrado);
  Serial.printf("\n  R0 guardado: %.4f\n", r0_calibrado);

  Serial.println("\n========================================");
  Serial.println("  CALIBRACIÓN FINALIZADA EXITOSAMENTE   ");
  Serial.println("  Escribe 'p' para activar producción.  ");
  Serial.println("========================================\n");
}

/**
 * Reconexión WiFi no bloqueante con backoff exponencial.
 * No llama WiFi.begin() en cada iteración del loop.
 */
void reconectarWiFi() {
  if (WiFi.status() == WL_CONNECTED) {
    wifiIntentos   = 0;
    wifiEnBackoff  = false;
    return;
  }

  uint32_t ahora = millis();

  // En backoff: esperar tiempo largo antes de reintentar
  if (wifiEnBackoff) {
    if (ahora - wifiBackoffInicio >= WIFI_BACKOFF_MS) {
      logSerial("INFO", "Fin de backoff WiFi. Reintentando conexión...");
      wifiEnBackoff = false;
      wifiIntentos  = 0;
    } else {
      return; // Todavía en backoff
    }
  }

  // Controlar cadencia de reintentos
  if (ahora - wifiUltimoIntento < WIFI_RETRY_DELAY_MS) return;
  wifiUltimoIntento = ahora;

  if (wifiIntentos >= WIFI_MAX_RETRIES) {
    logSerial("WARN", "Máx. intentos WiFi alcanzado. Esperando " + String(WIFI_BACKOFF_MS / 1000) + " seg...");
    wifiEnBackoff      = true;
    wifiBackoffInicio  = ahora;
    return;
  }

  wifiIntentos++;
  logSerial("INFO", "Reintento WiFi #" + String(wifiIntentos) + "/" + String(WIFI_MAX_RETRIES));
  WiFi.begin(ssid, password);
}

/**
 * Convierte PPM de gas a nivel de calidad de aire cualitativo.
 */
String calcularNivelAire(float ppm) {
  if (ppm < 0) return "\"NO_DATA\"";
  if (ppm < 5) return "\"VERY_GOOD\"";
  if (ppm < 25) return "\"GOOD\"";
  if (ppm < 50) return "\"REGULAR\"";
  if (ppm < 300) return "\"BAD\"";
  return "\"VERY_BAD\"";
}

/**
 * Envía datos al servidor vía STOMP SEND sobre WebSocket.
 */
void enviarDatos(float nivel, float gas, bool inclinado) {
  if (!stompConnected) {
    logSerial("WARN", "STOMP no conectado. Dato no enviado.");
    return;
  }

  String body = String("{") +
    "\"is_alive\":" + String(inclinado ? "false" : "true") + "," +
    "\"air_quality_level\":" + calcularNivelAire(gas) + "," +
    "\"ppm\":" + String(gas, 2) + "," +
    "\"filling_level\":" + String(nivel / 100.0, 4) +
    "}";

  enviarFrameStompSend(body);
  logSerial("INFO", "[ENVIO] Datos: " + body);
}

/**
 * Obtiene credenciales del backend vía HTTP GET /container/device.
 */
void obtenerCredenciales() {
  WiFiClientSecure client;
  client.setInsecure();
  HTTPClient http;
  String url = "https://" + String(backendHost) + "/container/device";
  http.begin(client, url);
  http.setTimeout(8000);

  int httpCode = http.GET();
  Serial.print("[httpCode] ");
  Serial.println(httpCode);
  if (httpCode == 200) {
    String payload = http.getString();
    Serial.print("[PAYLOAD] ");
    Serial.println(payload);
    StaticJsonDocument<200> doc;
    DeserializationError error = deserializeJson(doc, payload);
    if (error) {
      logSerial("ERROR", "JSON mal formado: " + String(error.c_str()));
      http.end();
      return;
    }
    deviceApiKey = doc["api_key"].as<String>();
    deviceSecret = doc["secret"].as<String>();
    logSerial("INFO", "Credenciales obtenidas. apiKey: " + deviceApiKey);
  } else {
    logSerial("ERROR", "Fallo al obtener credenciales. HTTP " + String(httpCode));
  }
  http.end();
}

/**
 * Verifica si el contenedor asignado cambió en el backend.
 * Si el api_key es diferente, reconecta el WebSocket con las nuevas credenciales.
 */
void verificarCambioContenedor() {
  String oldKey = deviceApiKey;
  obtenerCredenciales();
  if (deviceApiKey != oldKey && oldKey.length() > 0) {
    logSerial("INFO", "Contenedor reasignado (apiKey cambió). Reconectando WebSocket...");
    wsClient.stop();
    wsConectado = false;
    stompConnected = false;
    delay(1000);
    wsConectar();
  }
}

/**
 * Genera un Sec-WebSocket-Key válido (base64 de 16 bytes aleatorios).
 */
String wsGenerarKey() {
  const char charset[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  String key = "";
  for (int i = 0; i < 22; i++) {
    key += charset[random(64)];
  }
  key += "==";
  return key;
}

/**
 * Envía un frame WebSocket de texto (enmascarado) al servidor.
 */
bool wsEnviarFrame(const String& data) {
  if (!wsClient.connected()) return false;

  size_t len = data.length();
  uint8_t maskKey[4];
  for (int i = 0; i < 4; i++) maskKey[i] = random(0xFF);

  uint8_t header[14];
  uint8_t hLen = 0;

  header[0] = 0x81; // FIN + opcode text

  if (len < 126) {
    header[1] = 0x80 | len;
    hLen = 2;
  } else if (len < 0xFFFF) {
    header[1] = 0x80 | 126;
    header[2] = (len >> 8) & 0xFF;
    header[3] = len & 0xFF;
    hLen = 4;
  } else {
    header[1] = 0x80 | 127;
    uint64_t l = len;
    for (int i = 8; i > 0; i--) {
      header[1 + i] = l & 0xFF;
      l >>= 8;
    }
    hLen = 10;
  }

  header[hLen++] = maskKey[0];
  header[hLen++] = maskKey[1];
  header[hLen++] = maskKey[2];
  header[hLen++] = maskKey[3];

  wsClient.write(header, hLen);

  for (size_t i = 0; i < len; i++) {
    wsClient.write(data[i] ^ maskKey[i % 4]);
  }

  return true;
}

/**
 * Procesa frames WebSocket entrantes (no bloqueante).
 */
void wsLoop() {
  if (!wsClient.connected()) {
    if (wsConectado) {
      wsConectado = false;
      stompConnected = false;
      logSerial("WARN", "WebSocket desconectado.");
    }
    return;
  }

  if (!wsClient.available()) return;

  uint8_t header[2];
  if (wsClient.read(header, 2) != 2) {
    logSerial("WARN", "wsLoop: solo leyó " + String(wsClient.read(header, 2)) + " bytes de header");
    return;
  }

  uint8_t opcode = header[0] & 0x0F;
  uint64_t payloadLen = header[1] & 0x7F;

  if (payloadLen == 126) {
    uint8_t ext[2];
    if (wsClient.read(ext, 2) != 2) return;
    payloadLen = ((uint16_t)ext[0] << 8) | ext[1];
  } else if (payloadLen == 127) {
    uint8_t ext[8];
    if (wsClient.read(ext, 8) != 8) return;
    payloadLen = 0;
    for (int i = 0; i < 8; i++) payloadLen = (payloadLen << 8) | ext[i];
  }

  uint8_t maskKey[4];
  bool masked = header[1] & 0x80;
  if (masked) {
    wsClient.read(maskKey, 4);
  }

  if (payloadLen > 0) {
    uint8_t* payload = (uint8_t*)malloc(payloadLen + 1);
    if (!payload) return;

    size_t read = 0;
    while (read < payloadLen) {
      int r = wsClient.read(payload + read, payloadLen - read);
      if (r > 0) read += r;
      else delay(1);
    }

    if (masked) {
      for (size_t i = 0; i < payloadLen; i++) {
        payload[i] ^= maskKey[i % 4];
      }
    }

    payload[payloadLen] = 0;

    logSerial("DEBUG", "wsLoop: frame opcode=0x" + String(opcode, HEX) + " len=" + String(payloadLen));

    switch (opcode) {
      case 0x01: {
        String msg = String((char*)payload);
        logSerial("DEBUG", "wsLoop: TXT frame: " + msg.substring(0, 100));
        if (msg.indexOf("CONNECTED") >= 0) {
          stompConnected = true;
          logSerial("INFO", "STOMP CONNECTED. Listo para enviar métricas.");
        } else if (msg.indexOf("ERROR") >= 0) {
          logSerial("ERROR", "STOMP ERROR: " + msg.substring(0, 150));
        } else if (msg.indexOf("RECEIPT") >= 0) {
          logSerial("DEBUG", "STOMP RECEIPT recibido");
        }
        break;
      }
      case 0x09:
        Serial.println("[WS PING]");
        {
          uint8_t pong[2] = {0x8A, 0x00};
          wsClient.write(pong, 2);
        }
        break;
      case 0x0A:
        Serial.println("[WS PONG]");
        break;
      case 0x08:
        logSerial("WARN", "WebSocket cerrado por el servidor");
        wsClient.stop();
        wsConectado = false;
        stompConnected = false;
        break;
    }

    free(payload);
  } else {
    logSerial("DEBUG", "wsLoop: frame sin payload opcode=0x" + String(opcode, HEX));
    switch (opcode) {
      case 0x09:
        {
          uint8_t pong[2] = {0x8A, 0x00};
          wsClient.write(pong, 2);
        }
        break;
      case 0x08:
        logSerial("WARN", "WebSocket cerrado por el servidor");
        wsClient.stop();
        wsConectado = false;
        stompConnected = false;
        break;
    }
  }
}

/**
 * Conecta al servidor vía WSS, hace handshake HTTP Upgrade,
 * y envía STOMP CONNECT.
 */
void wsConectar() {
  wsClient.setInsecure();
  wsConectado = false;
  stompConnected = false;

  logSerial("INFO", "Conectando a wss://" + String(backendHost) + ":" + String(backendPort) + wsPath);

  if (!wsClient.connect(backendHost, backendPort)) {
    logSerial("ERROR", "Fallo conexión TCP/SSL");
    return;
  }
  logSerial("DEBUG", "TCP/SSL conectado exitosamente");

  String wsKey = wsGenerarKey();
  String request = "GET " + String(wsPath) + " HTTP/1.1\r\n";
  request += "Host: " + String(backendHost) + "\r\n";
  request += "Upgrade: websocket\r\n";
  request += "Connection: Upgrade\r\n";
  request += "Sec-WebSocket-Key: " + wsKey + "\r\n";
  request += "Sec-WebSocket-Version: 13\r\n";
  request += "\r\n";

  wsClient.print(request);
  logSerial("DEBUG", "HTTP Upgrade request enviado");

  unsigned long timeout = millis() + 8000;
  bool upgradeOk = false;

  while (millis() < timeout && wsClient.connected()) {
    if (wsClient.available()) {
      String line = wsClient.readStringUntil('\n');
      line.trim();

      logSerial("DEBUG", "RX línea: " + line.substring(0, 60));

      if (line.startsWith("HTTP/")) {
        if (line.indexOf("101") >= 0) {
          upgradeOk = true;
          logSerial("DEBUG", "HTTP 101 Switching Protocols OK");
        } else {
          logSerial("ERROR", "HTTP " + line.substring(9, 12));
          wsClient.stop();
          return;
        }
      }

      if (line.length() == 0) {
        logSerial("DEBUG", "Fin de headers HTTP");
        if (upgradeOk) {
          logSerial("INFO", "WebSocket conectado. Enviando STOMP CONNECT...");
          wsConectado = true;
          enviarFrameStompConnect();
        } else {
          logSerial("ERROR", "Handshake HTTP incompleto");
          wsClient.stop();
        }
        return;
      }
    }
  }

  if (!wsClient.connected()) {
    logSerial("WARN", "Conexión perdida durante handshake");
  } else if (!upgradeOk) {
    logSerial("ERROR", "Timeout en handshake WebSocket");
    wsClient.stop();
  }
}

/**
 * Envía frame STOMP CONNECT con credenciales del dispositivo.
 */
void enviarFrameStompConnect() {
  String frame = "CONNECT\n";
  frame += "accept-version:1.2\n";
  frame += "host:" + String(backendHost) + "\n";
  frame += "X-Api-Key:" + deviceApiKey + "\n";
  frame += "X-Secret:" + deviceSecret + "\n";
  frame += "\n";
  frame += '\0';
  wsEnviarFrame(frame);
  logSerial("DEBUG", "STOMP CONNECT enviado.");
}

/**
 * Envía frame STOMP SEND a /app/container.metrics.
 */
void enviarFrameStompSend(const String& body) {
  String frame = "SEND\n";
  frame += "destination:/app/container.metrics\n";
  frame += "content-type:application/json\n";
  frame += "\n";
  frame += body;
  frame += '\0';
  if (!wsEnviarFrame(frame)) {
    logSerial("ERROR", "STOMP SEND: wsEnviarFrame falló");
  } else {
    logSerial("INFO", "STOMP SEND enviado (" + String(frame.length()) + " bytes)");
  }
}

/**
 * Logger con nivel y timestamp en milisegundos.
 * Formato: [12345ms][NIVEL] Mensaje
 */
void logSerial(const char* nivel, const String& msg) {
  Serial.printf("[%8lums][%-5s] %s\n", millis(), nivel, msg.c_str());
}
