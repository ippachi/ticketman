import { ReactNode } from "react";
import Layout from "./layout";

export default function PublicLayout({ children }: { children: ReactNode }): JSX.Element {
  return <Layout>{children}</Layout>;
}
