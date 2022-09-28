import Layout from "./layout";
import { ReactNode } from "react";
import Error from "next/error";
import { useWorkspaceId } from "@/module/workspace-id";
import Drawer from "../drawer";
import Navbar from "../navbar";

export default function WorkspaceLayout({ children }: { children: ReactNode }): JSX.Element {
  const workspaceId = useWorkspaceId();

  if (workspaceId === "") {
    return <Error statusCode={404} />;
  } else {
    return (
      <Layout>
        <Drawer>
          <Navbar />
          <main className="container mx-auto px-8 mt-8">{children}</main>
        </Drawer>
      </Layout>
    );
  }
}
