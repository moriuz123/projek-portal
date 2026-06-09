import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url' // ⬅ untuk bikin alias

// Konfigurasi Vite
export default defineConfig({
  plugins: [vue()],

  // Setting alias supaya @ menunjuk ke folder src
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },

  // Setting dev server dan proxy API
  server: {
    proxy: {
      '/api': {
        target: 'http://portal.kie:8080', // URL backend
        changeOrigin: true,
        secure: false,
        // rewrite: (path) => path.replace(/^\/api/, ''), // aktifkan jika perlu hapus prefix /api
      },
      '/storage': {
        target: 'http://portal.kie:8080', // URL backend untuk storage
        changeOrigin: true,
        secure: false,
      },
    },
  },
})
