import { Client } from "@stomp/stompjs"
import SockJS from "sockjs-client"

const API_URL = "http://localhost:8080"

const client = new Client({
  webSocketFactory: () => new SockJS(`${API_URL}/ws`),
  reconnectDelay: 1000,
  connectHeaders: { 
    "X-Api-Key": "30129463-553a-4e17-88a2-bc8e04d1b3fe",
    "X-Secret": "password"
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
  onStompError: (frame) => {
    console.error('STOMP error: ', frame)
  }
})

client.activate()
