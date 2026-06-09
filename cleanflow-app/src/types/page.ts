export interface IPage<T> {
  content: T[]
  has_next: boolean
  cursor: string
}
