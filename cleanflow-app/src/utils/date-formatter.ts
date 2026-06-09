import dayjs from 'dayjs'

export const formatDateToString = (data: string) => {
  return dayjs(data).format('HH:mm DD/MM')
}
