import "../styles/globals.css";
import type { AppProps } from "next/app";
import { createClient, QueryClientProvider } from "@/module/query";
import { useWorkspaceIdOrNull, WorkspaceIdProvider } from "@/module/workspace-id";

const queryClient = createClient();

function MyApp({ Component, pageProps }: AppProps) {
  const workspaceId = useWorkspaceIdOrNull();

  if (workspaceId === null) {
    return <></>;
  } else {
    return (
      <QueryClientProvider client={queryClient}>
        <WorkspaceIdProvider value={workspaceId}>
          <Component {...pageProps} />
        </WorkspaceIdProvider>
      </QueryClientProvider>
    );
  }
}

export default MyApp;
