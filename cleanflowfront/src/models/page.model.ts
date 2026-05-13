export interface CursorPageResponse<T> {
  content: T[],
  cursor: number,
  has_next: boolean
} 