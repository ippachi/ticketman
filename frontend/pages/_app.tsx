import "../styles/globals.css";
import type { AppProps } from "next/app";
import { createClient, QueryClientProvider } from "@/module/query";
import { useOrganizationIdOrNull, OrganizationIdProvider } from "@/module/organization-id";

const queryClient = createClient();

function MyApp({ Component, pageProps }: AppProps): JSX.Element {
  const organizationId = useOrganizationIdOrNull();

  if (organizationId === null) {
    return <></>;
  } else {
    return (
      <QueryClientProvider client={queryClient}>
        <OrganizationIdProvider value={organizationId}>
          <Component {...pageProps} />
        </OrganizationIdProvider>
      </QueryClientProvider>
    );
  }
}

export default MyApp;
