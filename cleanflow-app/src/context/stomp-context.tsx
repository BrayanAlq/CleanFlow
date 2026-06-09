import { useAuthContext } from '@/context/auth-context'
import { Client, IFrame, IMessage, StompSubscription } from '@stomp/stompjs'
import { createContext, ReactNode, useCallback, useContext, useEffect, useRef, useState } from 'react'
import SockJS from 'sockjs-client'

const API_URL = process.env.EXPO_PUBLIC_API_REST_URL

type SubscribeCallback = (message: IMessage) => void

interface StompContextValue {
  connected: boolean
  subscribe: (destination: string, callback: SubscribeCallback) => StompSubscription | null
  publish: (destination: string, body: unknown) => void
}

const StompContext = createContext<StompContextValue | null>(null)

export const StompProvider = ({ children }: { children: ReactNode }) => {
  const [connected, setConnected] = useState(false)
  const clientRef = useRef<Client | null>(null)
  const { token } = useAuthContext()

  useEffect(() => {
    const client = new Client({
      webSocketFactory: () => new SockJS(`${API_URL}/ws`),
      connectHeaders: { Authorization: `Bearer ${token}` },
      onConnect: () => setConnected(true),
      onDisconnect: () => setConnected(false),
      onStompError: (frame: IFrame) => console.error('STOMP error: ', frame),
      debug: str => console.log('STOMP debug:', str),
      reconnectDelay: 5000,
    })

    client.activate()
    clientRef.current = client

    return () => void client.deactivate()
  }, [])

  const subscribe = useCallback((destination: string, callback: SubscribeCallback): StompSubscription | null => {
    if (!clientRef.current?.connected) return null
    return clientRef.current?.subscribe(destination, callback)
  }, [])

  const publish = useCallback((destination: string, body: unknown) => {
    clientRef.current?.publish({
      destination,
      body: JSON.stringify(body),
    })
  }, [])

  return <StompContext.Provider value={{ connected, subscribe, publish }}>{children}</StompContext.Provider>
}

export const useStompContext = () => {
  const context = useContext(StompContext)
  if (!context) throw new Error('useStomp must be used within a StompProvider')
  return context
}
