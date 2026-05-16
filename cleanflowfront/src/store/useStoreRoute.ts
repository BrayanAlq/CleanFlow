import type { RouteType } from "@/models/route.mode";
import { create } from "zustand";

interface RouteStore {
  routes: RouteType[]
  selectedRouteId: number | null
  setRoutes: (routes: RouteType[]) => void
  setSelectedRouteId: (id: number | null) => void
}

export const useStoreRoute = create<RouteStore>((set) => ({
  routes: [],
  selectedRouteId: null,
  setRoutes: (routes) => set({ routes }),
  setSelectedRouteId: (id) => set({ selectedRouteId: id })
}))