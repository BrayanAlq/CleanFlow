let currentRouteId: number | null = null
let isRouteActive = false

export const routeStore = {
  getRouteId: () => currentRouteId,
  setRouteId: (id: number | null) => {
    currentRouteId = id
  },
  isActive: () => isRouteActive,
  setActive: (active: boolean) => {
    isRouteActive = active
  },
}
