import * as SecureStore from 'expo-secure-store'

const ROUTE_ID_KEY = 'current_route_id'
const ROUTE_START_KEY = 'current_route_start'

export const routeStore = {
  getRouteId: async (): Promise<number | null> => {
    try {
      const id = await SecureStore.getItemAsync(ROUTE_ID_KEY)
      return id ? parseInt(id, 10) : null
    } catch (error) {
      console.error('Error al leer routeId desde SecureStore:', error)
      return null
    }
  },
  setRouteId: async (id: number | null) => {
    try {
      if (id === null) {
        await SecureStore.deleteItemAsync(ROUTE_ID_KEY)
      } else {
        await SecureStore.setItemAsync(ROUTE_ID_KEY, String(id))
      }
    } catch (error) {
      console.error('Error al guardar routeId en SecureStore:', error)
    }
  },
  getStartTimestamp: async (): Promise<number | null> => {
    try {
      const ts = await SecureStore.getItemAsync(ROUTE_START_KEY)
      return ts ? parseInt(ts, 10) : null
    } catch (error) {
      console.error('Error al leer startTimestamp:', error)
      return null
    }
  },
  setStartTimestamp: async (ts: number | null) => {
    try {
      if (ts === null) {
        await SecureStore.deleteItemAsync(ROUTE_START_KEY)
      } else {
        await SecureStore.setItemAsync(ROUTE_START_KEY, String(ts))
      }
    } catch (error) {
      console.error('Error al guardar startTimestamp:', error)
    }
  },
}
