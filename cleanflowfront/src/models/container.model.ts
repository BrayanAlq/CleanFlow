export interface ContainerType {
  id: number,
  name: string,
  latitude: number,
  longitude: number,
  address_name: string,
  container_image: ContainerImageType,
}

export interface ContainerImageType {
  id: number,
  url: string,
}