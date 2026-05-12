import type { ReportType } from "../models/report.model"
import dayjs from "dayjs"
import "dayjs/locale/es"
import { ReportImage } from "./ReportImage"
dayjs.locale("es")

export const ReportItem = ({ content, images, timestamp, user }: ReportType) => {
  const formatDate = (dateString: string) => {
    return dayjs(dateString).format("D [de] MMMM YYYY, HH:mm")
  }
  return (
    <div className="flex flex-col border-t-[0.1px] border-t-border-accent py-2">
      <div className="flex items-center justify-between">
        <h1 className="text-sm text-ellipsis">{user.first_name} {user.last_name}</h1>
        <p className="text-xs">{formatDate(timestamp)}</p>
      </div>
      <div className="flex flex-col gap-2">
        <p className="text-xs">{content}</p>
        <div className="flex items-center gap-2">
          {
            images?.map((img) => (
              <ReportImage key={img.id} {...img} />
            ))
          }
        </div>
      </div>
    </div>
  )
}