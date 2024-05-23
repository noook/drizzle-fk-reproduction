// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  runtimeConfig: {
    db: {
      logQueries: false,
    },
  },
  nitro: {
    experimental: {
      tasks: true,
    },
  },
})
