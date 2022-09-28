import { ComponentProps } from "react";

export default function FormControl({ children }: ComponentProps<"div">): JSX.Element {
  return <div className="form-control">{children}</div>;
}
