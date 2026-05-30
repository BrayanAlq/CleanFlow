import { Client } from "@stomp/stompjs"
import axios from "axios"
import SockJS from "sockjs-client"

const API_URL = "https://domain"

const getCredentials = async () => {
  const response = await axios.get(`${API_URL}/container/device`)
  return response.data // { api_key, secret }
}

getCredentials().then(({ api_key, secret }) => {
  console.log("Credentials received", api_key, secret)
  const client = new Client({
    webSocketFactory: () => new SockJS(`${API_URL}/ws`),
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
    onStompError: (frame) => {
      console.error('STOMP error: ', frame)
    }
  })
  
  client.activate()
}).catch(err => {
  console.error(err)
})

