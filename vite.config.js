import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import { resolve } from 'path'

// https://vite.dev/config/
export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd(), '')
  const isProduction = mode === 'production'
  const isGitHubPages = env.DEPLOY_TARGET === 'github' || process.argv.includes('--base=/Recipe-Generator/')
  
  return {
    plugins: [
      react({
        fastRefresh: !isProduction,
      }),
      tailwindcss()
    ],
    
    // Dynamic base path based on deployment target
    base: isGitHubPages ? '/Recipe-Generator/' : '/',
    
    // Build optimizations
    build: {
      outDir: 'dist',
      sourcemap: !isProduction,
      minify: isProduction ? 'esbuild' : false,
      target: 'esnext',
      rollupOptions: {
        output: {
          manualChunks: {
            vendor: ['react', 'react-dom'],
            animations: ['framer-motion'],
            utils: ['axios']
          }
        }
      },
      chunkSizeWarningLimit: 1000
    },
    
    // Development server configuration
    server: {
      port: 3000,
      open: true,
      cors: true,
      host: true
    },
    
    // Preview server configuration
    preview: {
      port: 4173,
      open: true,
      host: true
    },
    
    // ESBuild configuration for JSX
    esbuild: {
      loader: 'jsx',
      include: /src\/.*\.[jt]sx?$/,
      exclude: [],
      jsxInject: `import React from 'react'`
    },
    
    // Dependency optimization
    optimizeDeps: {
      include: ['react', 'react-dom', 'framer-motion', 'axios'],
      esbuildOptions: {
        loader: {
          '.js': 'jsx'
        }
      }
    },
    
    // Path resolution
    resolve: {
      alias: {
        '@': resolve(__dirname, 'src'),
        '@components': resolve(__dirname, 'src/components'),
        '@hooks': resolve(__dirname, 'src/hooks'),
        '@styles': resolve(__dirname, 'src/styles'),
        '@utils': resolve(__dirname, 'src/utils')
      }
    },
    
    // Environment variables
    define: {
      __APP_VERSION__: JSON.stringify(process.env.npm_package_version),
      __BUILD_TIME__: JSON.stringify(new Date().toISOString()),
    }
  }
})
