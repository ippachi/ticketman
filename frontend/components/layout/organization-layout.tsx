import Layout from "./layout";
import { ReactNode } from "react";
import Drawer from "../drawer";
import Navbar from "../navbar";

export default function OrganizationLayout({ children }: { children: ReactNode }): JSX.Element {
  return (
    <Layout>
      <Drawer>
        <Navbar />
        <main className="container mx-auto px-8 mt-8">{children}</main>
      </Drawer>
    </Layout>
  );
}
