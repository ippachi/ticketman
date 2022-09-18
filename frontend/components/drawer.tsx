import {ReactNode} from "react"

export default function Drawer({children}: {children: ReactNode}) {
  const drawerId = "drawer"

  return <div className="drawer drawer-mobile">
    <input id={drawerId} type="checkbox" className="drawer-toggle" />
    <div className="drawer-content">
      {children}
    </div>
    <div className="drawer-side">
      <label htmlFor={drawerId} className="drawer-overlay"></label>
      <div className="bg-base-200">
        <div className="w-full h-16 text-3xl text-center flex items-center">
          <span className="flex-1">
            Ticketman
          </span>
        </div>
        <ul className="menu p-4 w-80">
          <li><a>Sidebar Item 1</a></li>
          <li><a>Sidebar Item 2</a></li>
        </ul>
      </div>
    </div>
  </div>
}
