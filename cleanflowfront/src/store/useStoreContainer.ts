import { create } from 'zustand'

interface StoreContainer {
  selectedId: number | null
  setSelectedId: (id: number | null) => void
}

export const useStoreContainer = create<StoreContainer>((set) => ({
  selectedId: null,
  setSelectedId: (id: number | null) => set({ selectedId: id }),
}))