import type { ImageType } from "./image.model";
import type { UserType } from "./user.model";

export interface ReportType {
  id: number,
  timestamp: string,
  content: string,
  images: ImageType[],
  user: UserType
}