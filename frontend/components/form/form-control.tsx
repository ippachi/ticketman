import {ComponentProps} from "react";

export default function FormControl({children}: ComponentProps<"div">) {
  return <div className="form-control">{children}</div>
}
