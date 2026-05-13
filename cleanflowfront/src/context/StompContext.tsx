import { Client, type IFrame, type IMessage, type StompSubscription } from "@stomp/stompjs"
import { createContext, useCallback, useContext, useEffect, useRef, useState, type ReactNode } from "react"
import { API_URL } from "../api/apiUrl"
import SockJS from "sockjs-client"
import { useAuth } from "../auth/AuthContext"

type SubscribeCallback = (message: IMessage) => void

interface StompContextValue {
  connected: boolean
  subscribe: (destination: string, callback: SubscribeCallback) => StompSubscription | null
  publish: (destination: string, body: unknown) => void
}

interface StompProviderProps {
  children: ReactNode
}

const StompContext = createContext<StompContextValue | null>(null)

export function StompProvider({ children }: StompProviderProps) {
  const clientRef = useRef<Client | null>(null)
  const [connected, setConnected] = useState<boolean>(false)
  const { token: JWT_TOKEN } = useAuth()

  useEffect(() => {
    const client = new Client({
      webSocketFactory: () => new SockJS(`${API_URL}/ws`),
      connectHeaders: { Authorization: `Bearer ${JWT_TOKEN}` },
      onConnect: () => setConnected(true),
      onDisconnect: () => setConnected(false),
      onStompError: (frame: IFrame) => console.error('STOMP error: ', frame),
      debug: (str) => console.log("STOMP debug:", str),
      reconnectDelay: 5000
    })

    client.activate()
    clientRef.current = client

    return () => {
      void client.deactivate()
    }
  }, [])

  const subscribe = useCallback((destination: string, callback: SubscribeCallback): StompSubscription | null => {
    if (!clientRef.current?.connected) return null
    return clientRef.current.subscribe(destination, callback)
  }, [])

  const publish = useCallback((destination: string, body: unknown): void => {
    clientRef.current?.publish({
      destination, body: JSON.stringify(body)
    })
  }, [])

  return (
    <StompContext.Provider value={{ connected, subscribe, publish }}>
      {children}
    </StompContext.Provider>
  )
}

export const useStomp = (): StompContextValue => {
  const context = useContext(StompContext)
  if (!context) {
    throw new Error('useStomp must be used within a StompProvider')
  }
  return context
}