import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { Toaster } from 'sonner'
import { AuthProvider } from './auth/AuthContext.tsx'
import { StompProvider } from './context/StompContext.tsx'

const queryClient = new QueryClient()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>
      <StompProvider>
        <QueryClientProvider client={queryClient}>
          <Toaster position="bottom-center" />
          <App />
        </QueryClientProvider>
      </StompProvider>
    </AuthProvider>
  </StrictMode>,
)
