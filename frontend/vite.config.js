import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: "0.0.0.0",
    proxy: {
      "/api": {
        target: "http://127.0.0.1:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://127.0.0.1:5000": "http://127.0.0.1:5173",
        },
      },
      "/docs": {
        target: "http://127.0.0.1:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://127.0.0.1:5000": "http://127.0.0.1:5173",
        },
      },
      "/openapi.json": {
        target: "http://127.0.0.1:5000",
        changeOrigin: true,
        cookieDomainRewrite: {
          "http://127.0.0.1:5000": "http://127.0.0.1:5173",
        },
      },
    },
  },
});
