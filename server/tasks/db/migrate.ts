import { migrate } from 'drizzle-orm/node-postgres/migrator'

export default defineTask({
  meta: {
    name: 'db:migrate',
    description: 'Migrate database schema to the latest version',
  },
  async run() {
    try {
      const db = await useDatabase()
      await migrate(db, {
        migrationsFolder: 'server/database/migrations',
        migrationsTable: 'migrations',
      })
      return {
        result: 'ok',
      }
    }
    catch (e) {
      console.error(e)
      return {
        result: 'error',
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        error: (e as any).message,
      }
    }
  },
})
