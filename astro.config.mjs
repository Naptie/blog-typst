// @ts-check
import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";
import { typst } from "astro-typst";
import { URL_BASE as DEFAULT_URL_BASE } from "./config.json";
import { loadEnv } from "vite";

const { URL_BASE } = loadEnv(process.env.NODE_ENV ?? "", process.cwd(), "");
// https://astro.build/config
export default defineConfig({
  // Deploys to GitHub Pages
  site: "https://naptie.github.io",
  base: URL_BASE ?? DEFAULT_URL_BASE,

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
    build: {
      assetsInlineLimit(filePath, content) {
        const KB = 1024;
        return content.length < (filePath.endsWith(".css") ? 100 * KB : 4 * KB);
      },
    },
    ssr: {
      external: ["@myriaddreamin/typst-ts-node-compiler"],
    },
  },
});
