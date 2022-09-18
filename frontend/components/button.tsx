import {ComponentProps} from "react";

export default function Button({type, onClick, children}: ComponentProps<"button">) {
  return <button type={type} className="btn btn-primary" onClick={onClick}>{children}</button>
}
