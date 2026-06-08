import { privateApi } from '@/api/api'
import { IPage } from '@/types/page'
import { IReport } from '@/types/reports'

interface IGetReportsProps {
  containerId: number
  size: number
  cursor: string | null
}

export const getReportsByContainerId = async ({ containerId, size, cursor }: IGetReportsProps) => {
  const response = await privateApi.get<IPage<IReport>>(`/report/container/${containerId}`, {
    params: {
      size,
      ...(cursor !== null && { cursor }),
    },
  })
  return response.data
}
