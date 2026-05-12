import type { ReactNode } from "react"

export const BadgeItem = ({ text, children } : { text: string, children: ReactNode }) => {
  return (
    <div className="flex items-center gap-1">
      {children}
      <p className="text-sm">{text}</p>
    </div>
  )
}