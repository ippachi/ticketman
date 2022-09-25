import { ReactNode } from "react";
import Layout from "./layout";
import Error from "next/error";
import { useWorkspaceId } from "@/module/workspace-id";

export default function PublicLayout({ children }: { children: ReactNode }) {
  const workspaceId = useWorkspaceId();

  if (workspaceId !== "") {
    return <Error statusCode={404} />;
  } else {
    return <Layout>{children}</Layout>;
  }
}
