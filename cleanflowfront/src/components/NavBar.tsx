import { IconLogOut } from "@/icons/IconLogOut"
import { IconMap } from "@/icons/IconMap"
import { IconRoute } from "@/icons/IconRoute"
import { IconSidebar } from "@/icons/IconSidebar"
import { useState } from "react"
import { NavLink } from "react-router-dom"

const routes = [
  {
    name: 'Mapa',
    path: '/map',
    icon: <IconMap className="w-5 h-5" />
  },
  {
    name: 'Rutas',
    path: '/routes',
    icon: <IconRoute className="w-5 h-5" />
  },
  {
    name: 'Rutas Generadas',
    path: '/generated-routes',
    icon: <IconRoute className="w-5 h-5" />
  }
]

export const NavBar = () => {
  const [collapsed, setCollapsed] = useState(false)
  return (
    <main className={`flex flex-col border-[0.1px] border-border-accent rounded-xl m-5 h-[96vh] bg-bg-secondary text-white font-normal transition-all duration-300 ease-in-out overflow-hidden ${collapsed ? 'w-15' : 'w-50'}`}>
      <div
        className="border-b-[0.1px] border-b-border-accent h-15 w-full py-3 px-5 text-xl font-normal flex items-center justify-between">
        { !collapsed && <p>Cleanflow</p> }
        <button
          className="cursor-pointer"
          onClick={() => setCollapsed(prev => !prev)}
        >
          <IconSidebar className="w-5 h-5" />
        </button>
      </div>
      <div className="p-2 flex flex-col flex-1 gap-2 w-full text-xs" >
        {
          routes.map(({ name, path, icon }) => {
            return (
              <NavLink
                key={path}
                to={path}
                className={({ isActive }) => `h-10 text-xs flex items-center gap-2 p-2 rounded-lg ${
                  isActive
                    ? 'bg-black/20'
                    : 'hover:bg-white/10'
                } ${collapsed ? 'justify-center' : ''}`}
              >
                {icon} { !collapsed && <span className="">{name}</span>}
              </NavLink>
            )
          })
        }
      </div>
      <div className="p-5 h-auto text-xs flex items-center justify-between">
        {!collapsed && <p>Salir</p>}
        <button
          className="cursor-pointer"
        >
          <IconLogOut className="w-5 h-5" />
        </button>
      </div>
    </main>
  )
}