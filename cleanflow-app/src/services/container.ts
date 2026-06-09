import { privateApi } from '@/api/api'
import { IBound } from '@/types/bound'
import { IContainerType } from '@/types/container'

export const getContainerInViewport = async (bounds: IBound) => {
  const container = await privateApi.get<IContainerType[]>(
    '/container/viewport',
    {
      params: bounds,
    },
  )

  return container.data
}
