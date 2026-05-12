import { useEffect, useRef } from "react"
import { Client } from "@stomp/stompjs"
import { API_URL, JWT_TOKEN } from "../api/apiUrl"
import SockJS from "sockjs-client"


export const useStomp = (topic: string, onMessage: (msg: any) => void) => {
  const clientRef = useRef<Client | null>(null)

  useEffect(() => {
    const client = new Client({
      webSocketFactory: () => new SockJS(`${API_URL}/ws`),
      onConnect: () => {
        client.subscribe(topic, (message) => {
          onMessage(JSON.parse(message.body))
        })
      },
      connectHeaders: { Authorization: `Bearer ${JWT_TOKEN}` },
      onStompError: (frame) => {
        console.error('STOMP error: ', frame)
      }
    })
    
    client.activate()
    clientRef.current = client

    return () => { client.deactivate() }
  }, [topic])

  const sendMessage = (destination: string, body: object) => {
    if (clientRef.current?.connected) {
      clientRef.current.publish({
        destination,
        headers: { 'Authorization': `Bearer ${JWT_TOKEN}` },
        body: JSON.stringify(body)
      })
    } else {
      console.warn('Client not connected')
    }
  }

  return { sendMessage }
}