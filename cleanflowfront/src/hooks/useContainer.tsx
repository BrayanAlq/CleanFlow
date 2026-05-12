import { useQuery } from "@tanstack/react-query";
import type { BoundType } from "../components/MapView";
import { getContainerInViewport } from "../service/containerService";
import { toast } from "sonner";

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