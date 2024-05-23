import { createConsola } from 'consola'

export function useLogger(name?: string) {
  const logger = createConsola()

  if (name) {
    return logger.withTag(name)
  }

  return logger
}
