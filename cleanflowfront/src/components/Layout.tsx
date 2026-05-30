import { Outlet } from "react-router-dom"
import { NavBar } from "@/components/NavBar"
import { StompProvider } from "@/context/StompContext"

export const Layout = () => {
  return (
    <StompProvider>
      <div className="flex w-dvw h-dvh bg-black">
        <NavBar />
        <div className="flex flex-1 items-center justify-center">
          <Outlet />
        </div>
      </div>
    </StompProvider>
  )
}