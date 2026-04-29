#include <MQUnifiedsensor.h>
#include <Preferences.h>

// --- Variables de distancia ---
float distanciaAct = 0;
float distanciaMax = 0;

// --- Pines sensor ultrasonido ---
const int trigPin = 22;
const int echoPin = 23;

// --- Pines sensor inclinación SW-520D ---
const int inclinacionPin = 13;

// --- Configuración MQ-135 ---
#define placa "ESP-32"
#define Voltage_Resolution 3.3
#define pinMQ 14
#define type "MQ-135"
#define ADC_Bit_Resolution 12
#define RatioMQ135CleanAir 3.6

// --- Persistencia ---
Preferences preferences;

MQUnifiedsensor MQ135(placa, Voltage_Resolution, ADC_Bit_Resolution, pinMQ, type);

// --- Prototipos ---
float calcularDistanciaCm();
float calcularLlenado();
bool estaInclinado();
void calibrar();

// ===================== SETUP =====================
void setup() {
  Serial.begin(9600);

  // Pines
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(inclinacionPin, INPUT_PULLUP); // PULLUP interno del ESP32

  // Preferencias (distancia máxima guardada)
  preferences.begin("my-app", false);
  distanciaMax = preferences.getFloat("distMax", 0);

  // Configuración MQ-135
  MQ135.setRegressionMethod(1);
  MQ135.setA(102.2);
  MQ135.setB(-2.473);
  MQ135.init();

  Serial.print("Calibrando MQ-135, por favor espere");
  float calcR0 = 0;
  for (int i = 1; i <= 10; i++) {
    MQ135.update();
    calcR0 += MQ135.calibrate(RatioMQ135CleanAir);
    Serial.print(".");
  }
  MQ135.setR0(calcR0 / 10);
  Serial.println(" listo!");

  if (isinf(calcR0)) {
    Serial.println("ERROR: R0 infinito, verificá el cableado del MQ-135.");
    while (1);
  }
  if (calcR0 == 0) {
    Serial.println("ERROR: R0 = 0, pin analógico en cortocircuito.");
    while (1);
  }
}

// ===================== LOOP =====================
void loop() {
  // Calibrar si no hay distancia máxima guardada
  if (distanciaMax == 0) {
    calibrar();
  }

  // Leer sensores
  distanciaAct = calcularDistanciaCm();

  MQ135.update();
  float gasPPM = MQ135.readSensor();

  float nivelLlenado = calcularLlenado();
  bool inclinado = estaInclinado();

  // Debug por serial
  Serial.println("--- Lectura de sensores ---");
  Serial.println("Distancia actual: " + String(distanciaAct) + " cm");
  Serial.println("Nivel de llenado: " + String(nivelLlenado) + " %");
  Serial.println("Gas (NH4 ppm): " + String(gasPPM));
  Serial.println("Inclinado: " + String(inclinado ? "SÍ" : "NO"));

  delay(5000); // cada 5 segundos
}

// ===================== FUNCIONES =====================

float calcularDistanciaCm() {
  float duration, distanceCm;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(4);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distanceCm = duration * 0.0343 / 2.0; // fórmula estándar
  return distanceCm;
}

float calcularLlenado() {
  float porcentaje = (1.0 - (distanciaAct / distanciaMax)) * 100.0;
  // Limitar entre 0 y 100
  if (porcentaje < 0) porcentaje = 0;
  if (porcentaje > 100) porcentaje = 100;
  return porcentaje;
}

bool estaInclinado() {
  // LOW = inclinado (el módulo SW-520D activa la salida al inclinarse)
  return digitalRead(inclinacionPin) == LOW;
}

void calibrar() {
  Serial.println("Calibrando... Asegurate de que el tacho esté vacío.");
  float suma = 0;
  int muestras = 10;

  for (int i = 0; i < muestras; i++) {
    suma += calcularDistanciaCm();
    delay(200);
  }

  distanciaMax = suma / muestras;
  preferences.putFloat("distMax", distanciaMax);
  Serial.println("Distancia máxima calibrada: " + String(distanciaMax) + " cm");
}
