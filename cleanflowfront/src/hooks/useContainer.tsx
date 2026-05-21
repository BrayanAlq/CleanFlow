import type { BoundType } from "@/models/bound.model"
import type { ContainerCreateType, ContainerType } from "@/models/container.model"
import type { ErrorApiType } from "@/models/error.model"
import { createContainer, getContainerInViewport } from "@/service/containerService"
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query"
import type { AxiosError } from "axios"
import { toast } from "sonner"

export function useContainerInViewport(bounds: BoundType | null) {
  return useQuery({
    queryKey: ['container', 'viewport', bounds],
    queryFn: () => getContainerInViewport(bounds!),
    enabled: bounds !== null,
    staleTime: 30_000,
    throwOnError: false,
    meta: {
      onError: (error: Error) => {
        toast.error('Error al cargar contenedores', {
          description: error.message,
        })
      }
    }
  })
}

interface CreateContainerPayload {
  container: ContainerCreateType,
  image: File,
}

export const useCreateContainer = () => {
  const queryClient = useQueryClient()
  return useMutation<
    ContainerType,
    AxiosError<ErrorApiType>,
    CreateContainerPayload
  >({
    mutationFn: ({ container, image }) => createContainer(container, image),
    onError: (e) => console.log(e),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ['container', 'viewport']
      })
    }
  })
}