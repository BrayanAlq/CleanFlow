export interface CursorPageResponse<T> {
  content: T[],
  cursor: string,
  has_next: boolean
}