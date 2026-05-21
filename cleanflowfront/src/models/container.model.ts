export interface ContainerType {
  id: number,
  name: string,
  latitude: number,
  longitude: number,
  address_name: string,
  container_image: ContainerImageType,
}

export interface ContainerCreateType extends Omit<ContainerType, 'id' | 'container_image'> {}

export interface ContainerImageType {
  id: number,
  url: string,
}
