import "../styles/globals.css";
import type { AppProps } from "next/app";
import { createClient, QueryClientProvider } from "@/module/query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

const queryClient = createClient();

function MyApp({ Component, pageProps }: AppProps): JSX.Element {
  return (
    <QueryClientProvider client={queryClient}>
      <Component {...pageProps} />
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}

export default MyApp;
