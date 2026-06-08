import { useState, useMemo } from "react"
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query"
import { getDrivers, createDriver, updateUserStatus } from "@/service/adminService"
import type { CreateDriverPayload } from "@/models/driver.model"
import { toast } from "sonner"
import { IconEye } from "@/icons/IconEye"
import { IconEyeOff } from "@/icons/IconEyeOff"

const PAGE_SIZE = 5

const emptyForm: CreateDriverPayload = {
  username: '',
  password: '',
  email: '',
  first_name: '',
  last_name: '',
}

export const DriversScreen = () => {
  const [page, setPage] = useState(0)
  const [showForm, setShowForm] = useState(false)
  const [showPassword, setShowPassword] = useState(false)
  const [form, setForm] = useState<CreateDriverPayload>(emptyForm)

  const { data: allDrivers, isLoading } = useQuery({
    queryKey: ['admin', 'drivers'],
    queryFn: () => getDrivers(),
    staleTime: 30_000,
    meta: {
      onError: (error: Error) => {
        toast.error('Error al cargar conductores', {
          description: error.message,
        })
      }
    }
  })

  const queryClient = useQueryClient()

  const statusMutation = useMutation({
    mutationFn: ({ userId, enabled }: { userId: number, enabled: boolean }) =>
      updateUserStatus(userId, enabled),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin', 'drivers'] })
      toast.success('Estado actualizado')
    },
    onError: (error: Error) => {
      toast.error('Error al actualizar estado', {
        description: error.message,
      })
    }
  })

  const createMutation = useMutation({
    mutationFn: (data: CreateDriverPayload) => createDriver(data),
    onSuccess: () => {
      setShowForm(false)
      setForm(emptyForm)
      queryClient.invalidateQueries({ queryKey: ['admin', 'drivers'] })
      toast.success('Conductor creado')
    },
    onError: (error: Error) => {
      toast.error('Error al crear conductor', {
        description: error.message,
      })
    }
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    createMutation.mutate(form)
  }

  const totalElements = allDrivers?.length ?? 0
  const totalPages = Math.max(1, Math.ceil(totalElements / PAGE_SIZE))

  const drivers = useMemo(() => {
    if (!allDrivers) return []
    const start = page * PAGE_SIZE
    return allDrivers.slice(start, start + PAGE_SIZE)
  }, [allDrivers, page])

  return (
    <div className="h-[96vh] rounded-xl w-[97%] border-[0.1px] border-border-accent bg-bg-secondary flex flex-col p-6 overflow-hidden">
      <div className="flex items-center gap-3 mb-4">
        <h1 className="text-white text-lg font-normal">Conductores</h1>
        {!isLoading && (
          <span className="text-tiny text-white/50 bg-black/20 px-2 py-0.5 rounded-md border-[0.1px] border-border-accent">
            {totalElements} registrados
          </span>
        )}
        <button
          onClick={() => setShowForm(true)}
          className="ml-auto px-4 py-1.5 text-tiny rounded-lg bg-blue-600 hover:bg-blue-700 text-white transition-colors cursor-pointer"
        >
          + Agregar
        </button>
      </div>

      {isLoading ? (
        <div className="flex-1 flex items-center justify-center">
          <div className="w-6 h-6 border-2 border-white/30 border-t-white rounded-full animate-spin" />
        </div>
      ) : drivers.length > 0 ? (
        <div className="flex-1 flex flex-col overflow-hidden">
          <div className="flex-1 overflow-auto">
            <table className="w-full text-tiny text-white">
              <thead>
                <tr className="border-b-[0.1px] border-border-accent text-white/50">
                  <th className="text-left font-normal py-3 px-4">Nombres</th>
                  <th className="text-left font-normal py-3 px-4">Usuario</th>
                  <th className="text-left font-normal py-3 px-4">Email</th>
                  <th className="text-left font-normal py-3 px-4">Estado</th>
                </tr>
              </thead>
              <tbody>
                {drivers.map((driver) => (
                  <tr
                    key={driver.id}
                    className="border-b-[0.1px] border-border-accent hover:bg-white/10 transition-colors"
                  >
                    <td className="py-3 px-4">
                      {driver.first_name} {driver.last_name}
                    </td>
                    <td className="py-3 px-4 text-white/70">{driver.username}</td>
                    <td className="py-3 px-4 text-white/70">{driver.email}</td>
                    <td className="py-3 px-4">
                      <button
                        onClick={() =>
                          statusMutation.mutate({ userId: driver.id, enabled: !driver.enabled })
                        }
                        disabled={statusMutation.isPending}
                        className={`flex items-center gap-2 cursor-pointer disabled:opacity-50 transition-all ${
                          driver.enabled
                            ? 'text-green-400'
                            : 'text-red-400'
                        }`}
                      >
                        <span className={`relative w-10 h-5 rounded-full transition-colors ${
                          driver.enabled ? 'bg-green-500' : 'bg-white/20'
                        }`}>
                          <span className={`absolute top-0.5 left-0.5 w-4 h-4 rounded-full bg-white transition-transform ${
                            driver.enabled ? 'translate-x-5' : 'translate-x-0'
                          }`} />
                        </span>
                        <span className="text-tiny font-medium">
                          {driver.enabled ? 'Activo' : 'Inactivo'}
                        </span>
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex items-center justify-center gap-4 pt-4 pb-1">
            <button
              onClick={() => setPage((p) => p - 1)}
              disabled={page === 0}
              className="px-4 py-1.5 text-tiny rounded-lg border-[0.1px] border-border-accent bg-black/20 text-white/70 hover:bg-white/10 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
            >
              Anterior
            </button>
            <span className="text-tiny text-white/50">
              Página {page + 1} de {totalPages}
            </span>
            <button
              onClick={() => setPage((p) => p + 1)}
              disabled={page + 1 >= totalPages}
              className="px-4 py-1.5 text-tiny rounded-lg border-[0.1px] border-border-accent bg-black/20 text-white/70 hover:bg-white/10 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
            >
              Siguiente
            </button>
          </div>
        </div>
      ) : (
        <div className="flex-1 flex items-center justify-center text-white/40 text-tiny">
          No hay conductores registrados
        </div>
      )}

      {showForm && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60">
          <form
            onSubmit={handleSubmit}
            className="bg-bg-secondary border border-border-accent rounded-xl p-6 w-full max-w-md flex flex-col gap-4"
          >
            <h2 className="text-white text-base font-normal">Nuevo Conductor</h2>

            <div className="flex gap-3">
              <input
                placeholder="Nombres"
                value={form.first_name}
                onChange={(e) => setForm({ ...form, first_name: e.target.value })}
                required
                className="flex-1 bg-black/20 border border-border-accent rounded-lg px-3 py-2 text-tiny text-white placeholder-white/30 outline-none focus:border-white/50 transition-colors"
              />
              <input
                placeholder="Apellidos"
                value={form.last_name}
                onChange={(e) => setForm({ ...form, last_name: e.target.value })}
                required
                className="flex-1 bg-black/20 border border-border-accent rounded-lg px-3 py-2 text-tiny text-white placeholder-white/30 outline-none focus:border-white/50 transition-colors"
              />
            </div>

            <input
              placeholder="Usuario"
              value={form.username}
              onChange={(e) => setForm({ ...form, username: e.target.value })}
              required
              className="bg-black/20 border border-border-accent rounded-lg px-3 py-2 text-tiny text-white placeholder-white/30 outline-none focus:border-white/50 transition-colors"
            />

            <input
              placeholder="Email"
              type="email"
              value={form.email}
              onChange={(e) => setForm({ ...form, email: e.target.value })}
              required
              className="bg-black/20 border border-border-accent rounded-lg px-3 py-2 text-tiny text-white placeholder-white/30 outline-none focus:border-white/50 transition-colors"
            />

            <div className="relative">
              <input
                placeholder="Contrase&ntilde;a (m&iacute;n. 6 caracteres)"
                type={showPassword ? 'text' : 'password'}
                value={form.password}
                onChange={(e) => setForm({ ...form, password: e.target.value })}
                required
                minLength={6}
                className="w-full bg-black/20 border border-border-accent rounded-lg px-3 py-2 text-tiny text-white placeholder-white/30 outline-none focus:border-white/50 transition-colors"
              />
              <button
                type="button"
                onClick={() => setShowPassword((p) => !p)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-white/50 hover:text-white cursor-pointer"
              >
                {showPassword ? <IconEyeOff className="w-5 h-5" /> : <IconEye className="w-5 h-5" />}
              </button>
            </div>

            <div className="flex justify-end gap-3 mt-2">
              <button
                type="button"
                onClick={() => { setShowForm(false); setForm(emptyForm) }}
                className="px-4 py-1.5 text-tiny rounded-lg border border-border-accent text-white/70 hover:bg-white/10 transition-colors cursor-pointer"
              >
                Cancelar
              </button>
              <button
                type="submit"
                disabled={createMutation.isPending}
                className="px-4 py-1.5 text-tiny rounded-lg bg-blue-600 hover:bg-blue-700 text-white transition-colors disabled:opacity-50 cursor-pointer"
              >
                {createMutation.isPending ? 'Creando...' : 'Crear'}
              </button>
            </div>
          </form>
        </div>
      )}
    </div>
  )
}
