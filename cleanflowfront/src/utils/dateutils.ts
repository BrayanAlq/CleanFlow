import dayjs from "dayjs"
import "dayjs/locale/es"
import utc from "dayjs/plugin/utc"
import timezone from "dayjs/plugin/timezone"

dayjs.extend(utc)
dayjs.extend(timezone)
dayjs.locale("es")

export const formatDate = (dateString: string) => {
  return dayjs(dateString).local().format("D [de] MMMM YYYY, HH:mm")
}

export const formatToDate = (dateString: string) => {
  return dayjs(dateString).local().format("D [de] MMMM YYYY")
}

export const formatToHour = (dateString: string) => {
  return dayjs(dateString).local().format("HH:mm")
}