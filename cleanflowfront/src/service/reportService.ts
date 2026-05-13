import type { ReportType } from "../models/report.model"
import type { CursorPageResponse } from "../models/page.model"
import type { ImageType } from "../models/image.model"
import axiosInstance from "../api/axiosInstance"

export async function getReportsByContainerId(containerId: number, cursor: number | null) {
  const response = await axiosInstance.get<CursorPageResponse<ReportType>>(
    `/report/container/${containerId}`,
    {
      params: {
        size: 5,
        ...(cursor !== null && { cursor })
      }
    }
  )

  return response.data
}

export async function sendImages(images: File[]) {
  const formData = new FormData()
  images.forEach(i => formData.append('images', i))

  const response = await axiosInstance.post<ImageType[]>(
    `/report-image`,
    formData,
    {
      headers: {
        'Content-Type': 'multipart/form-data',
      }
    }
  )

  return response.data
}