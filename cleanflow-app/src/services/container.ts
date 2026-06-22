import { privateApi } from '@/api/api'
import { IBound } from '@/types/bound'
import { IContainerType, INearContainerFromResident } from '@/types/container'
import { IPage } from '@/types/page'

export const getContainerInViewport = async (bounds: IBound) => {
  const container = await privateApi.get<IContainerType[]>('/container/viewport', {
    params: bounds,
  })

  return container.data
}

interface IGetNearContainersProps {
  cursor: string | null
  size?: number
}
export const getNearContainerFromResident = async ({ cursor, size = 10 }: IGetNearContainersProps) => {
  const response = await privateApi.get<IPage<INearContainerFromResident>>('/resident/container/near', {
    params: { size, ...(cursor !== null && { cursor }) },
  })
  return response.data
}
