import { useMutation } from "@tanstack/react-query";
import { useCallback } from "react";
import { GraphQLClient } from "graphql-request";
import { TypedDocumentNode } from "@graphql-typed-document-node/core";

export const client = new GraphQLClient("http://localhost:2300/graphql", { credentials: "include" });

type Errors = { message: string; extensions: { code: string } }[];

export type UseMutationResult<Variables, Data> = {
  mutate: (variables: Variables, hooks: { onSuccess: (data: Data) => void; onError: (errors: Errors) => void }) => void;
};

export const useBaseMutation = <T, V, E>(
  document: TypedDocumentNode<T, V>,
  onSuccessData: (data: T) => E
): {
  mutate: (variables: V, hooks: { onSuccess: (data: E) => void; onError: (errors: Errors) => void }) => void;
} => {
  const { mutate } = useMutation({
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    mutationFn: (variables: V) => client.request(document, variables as Record<any, never>),
  });
  return {
    mutate: useCallback(
      (variables, hooks) =>
        mutate(variables, {
          onSuccess: (data) => hooks.onSuccess(onSuccessData(data)),
          // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-member-access
          onError: (error: any) => hooks.onError(error.response?.errors as Errors),
        }),
      // eslint-disable-next-line react-hooks/exhaustive-deps
      [mutate]
    ),
  };
};
