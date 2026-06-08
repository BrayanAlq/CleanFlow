import { Layout } from '@/components/Layout'
import { MapManageScreen } from '@/pages/MapManageScreen'
import { LoginScreen } from '@/pages/LoginScreen'
import { PrivateRoute } from '@/auth/PrivateRoute'
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import { RouteViewerScreen } from '@/pages/RouteViewerScreen'
import { GeneratedRoutesScreen } from '@/pages/GeneratedRoutesScreen'
import { DriversScreen } from '@/pages/DriversScreen'
import { ResidentsScreen } from '@/pages/ResidentsScreen'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginScreen />} />

        <Route path="/" element={<PrivateRoute><Layout /></PrivateRoute>}>
          <Route path="map" element={<MapManageScreen />} />
          <Route path="routes" element={<RouteViewerScreen />} />
          <Route path="generated-routes" element={<GeneratedRoutesScreen />} />
          <Route path="drivers" element={<DriversScreen />} />
          <Route path="residents" element={<ResidentsScreen />} />
        </Route>

        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
