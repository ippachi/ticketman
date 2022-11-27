import {
  QueryClient as QueryClientImpl,
  QueryClientProvider as ReactQueryQueryClientProvider,
} from "@tanstack/react-query";
import { ReactNode } from "react";

export const createClient = (): QueryClient => new QueryClientImpl({
  defaultOptions: {
    queries: {
      retry: 1
    }
  }
});

export const QueryClientProvider = ({
  client,
  children,
}: {
  client: QueryClient;
  children: ReactNode;
}): JSX.Element => {
  return <ReactQueryQueryClientProvider client={client as QueryClientImpl}>{children}</ReactQueryQueryClientProvider>;
};

export type QueryClient = unknown;
