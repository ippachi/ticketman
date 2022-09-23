import {
  QueryClient as QueryClientImpl,
  QueryClientProvider as ReactQueryQueryClientProvider,
} from "@tanstack/react-query";
import { ReactNode } from "react";

export const createClient = (): QueryClient => new QueryClientImpl({ defaultOptions: { queries: { suspense: true } } });

export const QueryClientProvider = ({ client, children }: { client: QueryClient; children: ReactNode }) => {
  return <ReactQueryQueryClientProvider client={client as QueryClientImpl}>{children}</ReactQueryQueryClientProvider>;
};

export type QueryClient = {};
