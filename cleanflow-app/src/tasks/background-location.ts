import { routeStore } from '@/store/route-store'
import * as Location from 'expo-location'
import * as TaskManager from 'expo-task-manager'

export const BACKGROUND_LOCATION_TASK = 'background-location'

TaskManager.defineTask(BACKGROUND_LOCATION_TASK, async ({ data, error }) => {
  if (error) {
    console.error('Background location task error:', error)
    return
  }

  const { locations } = data as { locations: Location.LocationObject[] }
  if (!locations || locations.length === 0) return

  const location = locations[locations.length - 1]
  const routeId = routeStore.getRouteId()

  if (!routeId || !routeStore.isActive()) return

  try {
  } catch (error) {
    console.error('Error sending bg location:', error)
  }
})
