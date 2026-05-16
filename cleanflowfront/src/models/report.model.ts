import type { ImageType } from "@/models/image.model"
import type { UserType } from "@/models/user.model"

export interface ReportType {
  id: number,
  timestamp: string,
  content: string,
  images: ImageType[],
  user: UserType
}