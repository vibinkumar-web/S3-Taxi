import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '')
  return {
    plugins: [
      react(),
      tailwindcss(),
    ],
    server: {
      proxy: {
        '/backend': {
          target: env.VITE_BACKEND_URL || 'http://localhost:8080',
          changeOrigin: true,
          secure: false,
          rewrite: (path) => path.replace(/^\/backend/, ''),
        },
      },
    },
    test: {
      globals: true,
      environment: 'jsdom',
      setupFiles: './src/setupTests.js',
      css: true,
    },
  }
})
