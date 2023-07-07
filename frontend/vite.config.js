import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: "0.0.0.0",
    proxy: {
      "/api": {
        target: "http://localhost:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://localhost:5000": "http://localhost:51723",
        },
      },
      "/docs": {
        target: "http://localhost:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://localhost:5000": "http://localhost:51723",
        },
      },
      "/openapi.json": {
        target: "http://localhost:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://localhost:5000": "http://localhost:51723",
        },
      },
    },
  },
});
