import { useMutation, useQuery } from "@tanstack/react-query";
import { useCallback } from "react";
import {
  CreateOrganizationMutationVariables,
  GenerateAuthUrlMutationVariables,
  Organization,
  SigninMutationVariables,
} from "src/gql/graphql";
import { graphql } from "../../src/gql";
import { GraphQLClient } from "graphql-request";

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

export const useCreateOrganizationMutation = (): {
  mutate: (
    variables: CreateOrganizationMutationVariables,
    hooks: { onSuccess: (data: Organization) => void; onError: (errors: Errors) => void }
  ) => void;
} => {
  const { mutate } = useMutation({
    mutationFn: (variables: CreateOrganizationMutationVariables) =>
      client.request(createOrganizationDocument, variables),
  });
  return {
    mutate: useCallback(
      (variables, hooks) =>
        mutate(variables, {
          onSuccess: (data) => hooks.onSuccess(data.createOrganization?.organization as Organization),
          // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-member-access
          onError: (error: any) => hooks.onError(error.response?.errors as Errors),
        }),
      [mutate]
    ),
  };
};

export const useSigninMutation = (): {
  mutate: (
    variables: SigninMutationVariables,
    hooks: { onSuccess: (data: null) => void; onError: (errors: Errors) => void }
  ) => void;
} => {
  const { mutate } = useMutation({
    mutationFn: (variables: SigninMutationVariables) => client.request(signinDocument, variables),
  });
  return {
    mutate: useCallback(
      (variables, hooks) =>
        mutate(variables, {
          onSuccess: (data) => hooks.onSuccess(data.signin?.user as null),
          // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-member-access
          onError: (error: any) => hooks.onError(error.response?.errors as Errors),
        }),
      [mutate]
    ),
  };
};

export const useGenerateAuthUrlMutation = (): {
  mutate: (
    variables: Record<string, never>,
    hooks: { onSuccess: (data: string) => void; onError: (errors: Errors) => void }
  ) => void;
} => {
  const { mutate } = useMutation({
    mutationFn: (variables: GenerateAuthUrlMutationVariables) => client.request(generateAuthUrlDocument, variables),
  });
  return {
    mutate: useCallback(
      (variables, hooks) =>
        mutate(variables, {
          onSuccess: (data) => hooks.onSuccess(data.generateAuthUrl?.url as string),
          // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/no-unsafe-member-access
          onError: (error: any) => hooks.onError(error.response?.errors as Errors),
        }),
      [mutate]
    ),
  };
};
