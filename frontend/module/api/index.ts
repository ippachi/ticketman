import { useMutation, useQuery } from "@tanstack/react-query";
import { useCallback } from "react";
import { CreateOrganizationMutationVariables, Organization, SigninMutationVariables } from "src/gql/graphql";
import { graphql } from "../../src/gql";
import { GraphQLClient } from "graphql-request";
import { TypedDocumentNode } from "@graphql-typed-document-node/core";

export const client = new GraphQLClient("http://localhost:2300/graphql", { credentials: "include" });

const createOrganizationDocument = graphql(`
  mutation createOrganization($id: ID!, $name: String!) {
    createOrganization(id: $id, name: $name) {
      organization {
        id
        name
      }
    }
  }
`);

const fetchOrganizationDocument = graphql(`
  query fetchOrganization($id: String!) {
    organization(id: $id) {
      id
      name
    }
  }
`);

const signinDocument = graphql(`
  mutation signin($code: String!, $state: String!) {
    signin(code: $code, state: $state) {
      user {
        name
      }
    }
  }
`);

const generateAuthUrlDocument = graphql(`
  mutation generateAuthUrl {
    generateAuthUrl {
      url
    }
  }
`);

type Errors = { message: string; extensions: { code: string } }[];

type UseMutationResult<Variables, Data> = {
  mutate: (variables: Variables, hooks: { onSuccess: (data: Data) => void; onError: (errors: Errors) => void }) => void;
};

export const useOrganization = (
  id: string,
  options: { useErrorBoundary: boolean } = { useErrorBoundary: false }
): { data: Organization | undefined } => {
  const { data } = useQuery({
    queryKey: ["organizations", id],
    queryFn: () => client.request(fetchOrganizationDocument, { id }),
    ...options,
  });
  return { data: data?.organization };
};

export const useCreateOrganizationMutation = (): UseMutationResult<
  CreateOrganizationMutationVariables,
  Organization
> => {
  return useBaseMutation(createOrganizationDocument, (data) => data.createOrganization?.organization as Organization);
};

export const useSigninMutation = (): UseMutationResult<SigninMutationVariables, null> => {
  return useBaseMutation(signinDocument, (data) => data.signin?.user as null);
};

export const useGenerateAuthUrlMutation = (): UseMutationResult<Record<string, never>, string> => {
  return useBaseMutation(generateAuthUrlDocument, (data) => data.generateAuthUrl?.url as string);
};

const useBaseMutation = <T, V, E>(
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
      [mutate, onSuccessData]
    ),
  };
};
