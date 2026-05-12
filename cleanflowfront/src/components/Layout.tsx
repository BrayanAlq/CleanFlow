import { Outlet } from "react-router-dom"
import { NavBar } from "./NavBar"

export const Layout = () => {
  return (
    <div className="flex w-dvw h-dvh bg-black">
      <div className="w-50">
        <NavBar />
      </div>
      <div className="flex flex-1 items-center justify-center">
        <Outlet />
      </div>
    </div>
  )
}