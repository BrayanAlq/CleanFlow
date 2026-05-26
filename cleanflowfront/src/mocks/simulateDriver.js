import { Client } from "@stomp/stompjs"
import SockJS from "sockjs-client"

const API_URL = "http://localhost:8080"
const USERNAME = "driver1"
const PASSWORD = "password"

async function getToken() {
  const response = await fetch(`${API_URL}/auth/login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username: USERNAME, password: PASSWORD })
  })
  if (!response.ok) {
    const text = await response.text()
    throw new Error(`Login failed (${response.status}): ${text}`)
  }
  const data = await response.json()
  return data.token
}

async function main() {
  console.log(`Logging in as ${USERNAME}...`)
  const token = await getToken()
  console.log("Token obtained")

  const client = new Client({
    webSocketFactory: () => new SockJS(`${API_URL}/ws`),
    reconnectDelay: 1000,
    connectHeaders: { Authorization: `Bearer ${token}` },
    onConnect: () => {
      console.log("Connected")

      let latitude = -12.082
      let longitude = -77.016

      setInterval(() => {
        latitude += 0.0001
        longitude += 0.0001

        client.publish({
          destination: "/app/driver.location",
          body: JSON.stringify({ latitude, longitude })
        })

        console.log({ latitude, longitude })
      }, 2000)
    },
    onStompError: (frame) => {
      console.error('STOMP error: ', frame)
    }
  })

  client.activate()
}

main().catch(console.error)
