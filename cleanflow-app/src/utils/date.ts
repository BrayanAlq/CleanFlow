export function parseAge(createdAt: string): string {
  const diff = Date.now() - new Date(createdAt).getTime()
  const hours = Math.floor(diff / 3_600_000)
  if (hours < 1) return 'recién creada'
  if (hours === 1) return 'hace 1 hora'
  return `hace ${hours} horas`
}
