import { ReactNode } from "react";
import Layout from "./layout";
import Error from "next/error";
import { useOrganizationId } from "@/module/organization-id";

export default function PublicLayout({ children }: { children: ReactNode }): JSX.Element {
  const organizationId = useOrganizationId();

  if (organizationId !== "") {
    return <Error statusCode={404} />;
  } else {
    return <Layout>{children}</Layout>;
  }
}
