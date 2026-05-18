import dayjs from "dayjs"
import "dayjs/locale/es"
dayjs.locale("es")

export const formatDate = (dateString: string) => {
  return dayjs(dateString).format("D [de] MMMM YYYY, HH:mm")
}

export const formatToDate = (dateString: string) => {
  return dayjs(dateString).format("D [de] MMMM YYYY")
}

export const formatToHour = (dateString: string) => {
  return dayjs(dateString).format("HH:mm")
}