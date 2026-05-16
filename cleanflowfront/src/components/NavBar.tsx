import { NavLink } from "react-router-dom"

const routes = [
  { name: 'Mapa', path: '/map' },
  { name: 'Rutas', path: '/routes' },
  { name: 'Sobre', path: '/about' },
  { name: 'Login', path: '/login' },
  { name: 'Registro', path: '/register' },
  { name: 'Ayuda', path: '/help' },
]

export const NavBar = () => {
  return (
    <main className="flex flex-col border-[0.1px] border-border-accent rounded-2xl m-5 w-full h-[96vh] bg-bg-secondary text-white">
      <div className="border-b-[0.1px] border-b-border-accent w-full py-3 px-5 text-xl font-main-title">CleanFlow</div>
      <div className="p-5 flex flex-col flex-1" >
        {
          routes.map(({ name, path }) => {
            return (
              <NavLink
                key={path} to={path}
                className="text-base"
              >
                {name}
              </NavLink>
            )
          })
        }
      </div>
      <div className="p-5 h-auto text-base">
        Log Out
      </div>
    </main>
  )
}