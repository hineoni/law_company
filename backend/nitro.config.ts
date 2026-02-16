import { defineNitroConfig } from "nitropack/config"

// https://nitro.build/config
export default defineNitroConfig({
  compatibilityDate: "latest",
  srcDir: "server",
  imports: false,
  // routeRules: {
  //   "/api/**": { cors: true, headers: { "Access-Control-Allow-Origin": "*" } },
  // },
});
