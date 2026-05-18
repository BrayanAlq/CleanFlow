import { Outlet } from "react-router-dom"
import { NavBar } from "@/components/NavBar"

export const Layout = () => {
  return (
    <div className="flex w-dvw h-dvh bg-black">
      <NavBar />
      <div className="flex flex-1 items-center justify-center">
        <Outlet />
      </div>
    </div>
  )
}