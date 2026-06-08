export interface PageableResponse<T> {
  content: T[],
  total_pages: number,
  total_elements: number,
  last: boolean,
  first: boolean,
  size: number,
  number: number,
  number_of_elements: number,
  empty: boolean,
}
