import "../styles/globals.css";
import type { AppProps } from "next/app";
import { createClient, QueryClientProvider } from "@/module/query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import { Toaster } from "@/module/toast";

const queryClient = createClient();

function MyApp({ Component, pageProps }: AppProps): JSX.Element {
  return (
    <QueryClientProvider client={queryClient}>
      <Component {...pageProps} />
      <Toaster />
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}

export default MyApp;
