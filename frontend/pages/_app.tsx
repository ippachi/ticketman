import "../styles/globals.css";
import type { AppProps } from "next/app";
import { createClient, QueryClient, QueryClientProvider } from "../module/query";
import { Suspense } from "react";

const queryClient = createClient();

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <QueryClientProvider client={queryClient}>
      <Component {...pageProps} />
    </QueryClientProvider>
  );
}

export default MyApp;
