import { ReactNode } from "react";
import ErrorBoundary from "../error-boundary";

export default function Layout({ children }: { children: ReactNode }): JSX.Element {
  return <ErrorBoundary>{children}</ErrorBoundary>;
}
