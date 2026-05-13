import { Client } from "@stomp/stompjs"
import SockJS from "sockjs-client"

const API_URL = "http://localhost:8080"
const JWT_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImRyaXZlcjEiLCJyb2xlIjoiRFJJVkVSIiwiaWQiOjIsImZpcnN0X25hbWUiOiJEcml2ZXIiLCJsYXN0X25hbWUiOiJMaW1hIiwiZXhwIjoxNzc5MjE5OTg1fQ.5qh9qqmE7MOhehqHFLIu6s3aMqc92DDdlhVUyqBUhFE"

const client = new Client({
  webSocketFactory: () => new SockJS(`${API_URL}/ws`),
  reconnectDelay: 1000,
  connectHeaders: { Authorization: `Bearer ${JWT_TOKEN}` },
  onConnect: () => {
    console.log("Connected")

    let latitude = -12.082
    let longitude = -77.016

    setInterval(() => {

      latitude += 0.0001
      longitude += 0.0001

      client.publish({
        destination: "/app/driver.location",
        body: JSON.stringify({
          latitude,
          longitude
        })
      })

      console.log({
        latitude,
        longitude
      })

    }, 2000)
  },
  onStompError: (frame) => {
    console.error('STOMP error: ', frame)
  }
})

client.activate()
