import { Toaster } from "@/module/toast";
import { ReactNode } from "react";

export default function Layout({ children }: { children: ReactNode }) {
  return (
    <>
      {children}
      <Toaster position="bottom-right" />
    </>
  );
}
