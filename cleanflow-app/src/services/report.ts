import { privateApi } from '@/api/api'
import { IPage } from '@/types/page'
import { IImageReport, IReport } from '@/types/reports'

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

export const saveImage = async (uris: string[]) => {
  const formData = new FormData()

  uris.forEach(uri => {
    const filename = uri.split('/').pop() ?? 'photo.jpg'
    const ext = filename.split('.').pop()
    const mimeType = ext === 'png' ? 'image/png' : 'image/jpeg'

    formData.append('images', {
      uri,
      name: filename,
      type: mimeType,
    } as any)
  })

  const response = await privateApi.post<IImageReport[]>('/report-image', formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  })

  return response.data
}
