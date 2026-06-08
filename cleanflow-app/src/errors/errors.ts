const ErrorMessages: Record<string, string> = {
  INVALID_CREDENTIALS: 'Usuario o contraseña incorrectos',
}

export const getErrorMessage = (error: string | undefined) => {
  if (!error) return 'Ocurrió un error inesperado'
  return ErrorMessages[error] ?? 'Ocurrió un error inesperado'
}
