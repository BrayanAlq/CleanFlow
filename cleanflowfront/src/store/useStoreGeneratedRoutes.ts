import type { GeneratedRouteType } from "@/models/generated.route.model";
import { create } from "zustand";

interface GeneratedRouteStore {
  generatedRoutes: GeneratedRouteType[]
  selectedGeneratedRouteId: number | null
  setGeneratedRoutes: (routes: GeneratedRouteType[]) => void
  setSelectedGeneratedRouteId: (id: number | null) => void
}

export const useStoreGeneratedRoutes = create<GeneratedRouteStore>((set) => ({
  generatedRoutes: [],
  selectedGeneratedRouteId: null,
  setGeneratedRoutes: (generatedRoutes) => set({ generatedRoutes }),
  setSelectedGeneratedRouteId: (id) => set({ selectedGeneratedRouteId: id })
}))