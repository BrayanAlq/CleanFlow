import type { BoundType } from "@/models/bound.model"
import type { ContainerCreateType, ContainerType } from "@/models/container.model"
import axiosInstance from "@/api/axiosInstance"

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

export const createContainer = async (container: ContainerCreateType, image: File) => {
  const formData = new FormData()
  formData.append(
    'container',
    new Blob([JSON.stringify(container)], { type: 'application/json' }),
  )
  formData.append('image', image)
  const response = await axiosInstance.post<ContainerType>(
    '/container',
    formData,
    {
      headers: {
        'Content-Type': 'multipart/form-data',
      }
    }
  )
  return response.data
}