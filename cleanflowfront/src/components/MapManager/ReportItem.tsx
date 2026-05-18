import type { ReportType } from "@/models/report.model"
import { ReportImage } from "@/components/MapManager/ReportImage"
import { formatDate } from "@/utils/dateutils"

export const ReportItem = ({ content, images, timestamp, user }: ReportType) => {
  return (
    <div className="flex flex-col py-2 bg-black/20 px-2 rounded-lg">
      <div className="flex items-center justify-between">
        <h1 className="text-ellipsis text-xs">{user.first_name} {user.last_name}</h1>
        <p className="text-tiny">{formatDate(timestamp)}</p>
      </div>
      <div className="flex flex-col gap-2">
        <p className="text-tiny">{content}</p>
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