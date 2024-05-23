# Nuxt 3 Minimal Starter

Look at the [Nuxt 3 documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

Make sure to install the dependencies:

```bash
# pnpm
pnpm install
```

This project uses a local instance of Supabase, you can start it with the following command:

```bash
npx supabase start
```

Upon start, Supabase will provide you the database URL. Copy it, and paste it in the `.env` file:

```bash
DATABASE_URL=<supabase-database-url>
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# pnpm
pnpm run dev
```

## Reproduction

You can checkout the last commit to see the diff, and run the following command:

```bash
pnpm migrate
```

This will generate the SQL migration file in the `migrations` folder.

## Running the migration

To run the migration, you can visit <http://localhost:3000/_nitro/tasks/db:migrate>. The migration should be ran automatically. (Note that the dev server needs ot be running)

To inspect the database, you can use the **Studio URL** provided by supabase when you started the instance.