import { Client } from "@stomp/stompjs"
import SockJS from "sockjs-client"

const API_URL = "http://localhost:8080"

const client = new Client({
  webSocketFactory: () => new SockJS(`${API_URL}/ws`),
  reconnectDelay: 1000,
  connectHeaders: { 
    "X-Api-Key": "b396bd16-5e58-467c-9141-8c0ceba31e6d",
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
