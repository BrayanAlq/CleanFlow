import { Client } from "@stomp/stompjs"
import axios from "axios"

const API_URL = "ws://localhost:8080"
const REST_URL = "http://localhost:8080"

const getCredentials = async () => {
  const response = await axios.get(`${REST_URL}/container/device`)
  return response.data // { api_key, secret }
}

getCredentials().then(({ api_key, secret }) => {
  const client = new Client({
    brokerURL: `${API_URL}/ws-device`,
    reconnectDelay: 1000,
    connectHeaders: {
      "X-Api-Key": api_key,
      "X-Secret": secret
    },
    onConnect: () => {
      console.log("Connected")
  
      let isAlive = true
      let airQualityLevel = "good"
      let ppm = 10.2
      let fillingLevel = 0.5
  
      setInterval(() => {
  
        client.publish({
          destination: "/app/container.metrics",
          body: JSON.stringify({
            "is_alive": isAlive,
            "air_quality_level": airQualityLevel,
            "ppm": ppm,
            "filling_level": fillingLevel
          })
        })
  
        console.log({
          isAlive,
          airQualityLevel,
          ppm,
          fillingLevel
        })
  
      }, 2000)
    },
    onWebSocketError: (error) => {
      console.error('WebSocket error:', error)
    },
    onWebSocketClose: (event) => {
      console.error('WebSocket closed:', event.code, event.reason)
    },
    onDisconnect: () => {
      console.log('Disconnected')
    },
    onStompError: (frame) => {
      console.error('STOMP error:', frame)
    },
    debug: (str) => {
      console.log('STOMP debug:', str) // ← esto muestra todo el handshake
    }
  })
  
  client.activate()
}).catch(err => {
  console.error(err)
})

