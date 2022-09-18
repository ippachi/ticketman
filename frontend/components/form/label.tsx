import {ComponentProps} from "react";

export default function Label({children, htmlFor}: ComponentProps<"label">) {
  return <label htmlFor={htmlFor} className="label">{children}</label>
}
