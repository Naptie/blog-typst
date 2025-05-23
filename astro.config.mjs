// @ts-check
import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";
import { typst } from "astro-typst";
import { URL_BASE } from "./config.json";

// https://astro.build/config
export default defineConfig({
  // Deploys to GitHub Pages
  site: "https://naptie.github.io",
  base: process.env.URL_BASE ?? URL_BASE,

  integrations: [
    sitemap(),
    typst({
      // Always builds HTML files
      mode: {
        default: "html",
        detect: () => "html",
      },
    }),
  ],

  vite: {
    ssr: {
      external: ["@myriaddreamin/typst-ts-node-compiler"],
    },
  },
});
