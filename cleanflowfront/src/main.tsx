import App from '@/App.tsx'
import { AuthProvider } from '@/auth/AuthContext.tsx'
import { StompProvider } from '@/context/StompContext.tsx'
import './index.css'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { Toaster } from 'sonner'

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
