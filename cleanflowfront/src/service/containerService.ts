import type { BoundType } from "../components/MapView"
import type { ContainerType } from "../models/container.model"
import axiosInstance from "../api/axiosInstance"

export async function getContainerInViewport(bounds: BoundType) {
  const { north, south, east, west } = bounds
  const containers = await axiosInstance.get<ContainerType[]>(
    `/container/viewport?north=${north}&south=${south}&east=${east}&west=${west}`
  )

  return containers.data
}

export async function getContainerById(id: number) {
  const container = await axiosInstance.get<ContainerType>(
    `/container/${id}`,
  )

  return container.data
}