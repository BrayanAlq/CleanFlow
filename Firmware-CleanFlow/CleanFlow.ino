// =============================================================
//  CleanFlow - ESP32
// =============================================================

#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <Preferences.h>
#include <MQUnifiedsensor.h>
#include "secrets.h"   // <-- WiFi credentials aquí (NO subir a git)

// --- Configuración del Servidor ---
const char* serverName = "http://webhook.site/d32820fd-276b-4050-bef8-12add98f9bd5";

// --- Pines Hardware ---
const int trigPin        = 22;
const int echoPin        = 23;
const int inclinacionPin = 15;
#define   pinMQ            34

// --- Configuración MQ-135 ---
#define placa                 "ESP-32"
#define Voltage_Resolution    3.3
#define type                  "MQ-135"
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

// Instancias
Preferences    preferences;
MQUnifiedsensor MQ135(placa, Voltage_Resolution, ADC_Bit_Resolution, pinMQ, type);

// --- Prototipos ---
float  calcularDistanciaCm();
float  calcularLlenado();
bool   estaInclinado();
void   ejecutarCalibracionCompleta();
void   reconectarWiFi();
void   enviarDatos(float nivel, float gas, bool inclinado);
void   logSerial(const char* nivel, const String& msg);

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
  if (WiFi.status() == WL_CONNECTED) {
    logSerial("INFO", "WiFi conectado. IP: " + WiFi.localIP().toString());
    wifiIntentos = 0;
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

  Serial.println("\n--- COMANDOS: [c] Calibrar  |  [p] Modo Producción  |  [r] Reset ---\n");
}

// =============================================================
void loop() {
  uint32_t ahora = millis();

  // ── Verificar precalentamiento MQ-135 ──────────────────────
  if (!mqCalentado && (ahora - tiempoEncendido >= MQ135_WARMUP_MS)) {
    mqCalentado = true;
    logSerial("INFO", "MQ-135 precalentado. Lecturas de gas ahora son confiables.");
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

  // ── Reconexión WiFi no bloqueante ───────────────────────────
  reconectarWiFi();

  delay(5000);
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
 * Envía datos al servidor vía HTTP POST en formato JSON.
 */
void enviarDatos(float nivel, float gas, bool inclinado) {
  if (WiFi.status() != WL_CONNECTED) {
    logSerial("WARN", "Sin WiFi. Dato no enviado.");
    return;
  }

  HTTPClient http;
  http.begin(serverName);
  http.addHeader("Content-Type", "application/json");
  http.setTimeout(8000); // 8 segundos máximo para no bloquear demasiado

  // 400 bytes: margen cómodo para campos actuales y futuros
  StaticJsonDocument<400> doc;
  doc["id_dispositivo"] = "BIN-001";
  doc["nivel"]          = serialized(String(nivel, 2));
  doc["gas_ppm"]        = serialized(String(gas,   2));
  doc["inclinado"]      = inclinado;
  doc["uptime_seg"]     = millis() / 1000;

  String jsonStr;
  serializeJson(doc, jsonStr);

  int httpCode = http.POST(jsonStr);
  if (httpCode > 0) {
    logSerial("INFO", "POST OK -> HTTP " + String(httpCode));
  } else {
    logSerial("ERROR", "POST fallido -> " + http.errorToString(httpCode));
  }
  http.end();
}

/**
 * Logger con nivel y timestamp en milisegundos.
 * Formato: [12345ms][NIVEL] Mensaje
 */
void logSerial(const char* nivel, const String& msg) {
  Serial.printf("[%8lums][%-5s] %s\n", millis(), nivel, msg.c_str());
}
