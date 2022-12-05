import { useCallback } from "react";
import { gql } from "graphql-request";
import {
  CreateOrganizationMutationVariables,
  useCreateOrganizationMutation as useGeneratedCreateOrganizationMutation,
  useSigninMutation as useGeneratedSigninMutation,
  useGenerateAuthUrlMutation as useGeneratedGenerateAuthUrlMutation,
  useFetchOrganizationQuery,
  Organization,
  SigninMutationVariables,
  Project,
  GenerateAuthUrlMutation,
} from "../../src/generated/graphql";
import { ErrorResponse, UseMutateResult } from "./type";
import { client, handleError } from "./utils";

gql`
  mutation createOrganization($id: ID!, $name: String!) {
    createOrganization(id: $id, name: $name) {
      organization {
        id
        name
      }
    }
  }
`;

gql`
  query fetchOrganization($id: String!) {
    organization(id: $id) {
      id
      name
    }
  }
`;

gql`
  mutation signin($code: String!, $state: String!) {
    signin(code: $code, state: $state) {
      user {
        name
      }
    }
  }
`;

gql`
  mutation generateAuthUrl {
    generateAuthUrl {
      url
    }
  }
`;

export const useOrganization = (
  id: string,
  options: { useErrorBoundary: boolean } = { useErrorBoundary: false }
): { data: Organization | undefined; isLoading: boolean; errorCode: string | null } => {
  const { data, isLoading, error } = useFetchOrganizationQuery(client, { id }, options);
  const errorCode = (error as { response: ErrorResponse })?.response.errors[0].extensions.code;

  return { data: data?.organization, isLoading, errorCode };
};

export const useCreateOrganizationMutation = (): UseMutateResult<Organization, CreateOrganizationMutationVariables> => {
  const { mutate } = useGeneratedCreateOrganizationMutation<Error>(client);
  return {
    mutate: useCallback(
      (variables, hooks) =>
        mutate(variables, {
          onSuccess: (data) => {
            hooks.onSuccess(data.createOrganization?.organization as Organization);
          },
          onError: (error) => {
            handleError(hooks, error);
          },
        }),
      [mutate]
    ),
  };
};

export const useSigninMutation = (): UseMutateResult<Project, SigninMutationVariables> => {
  const { mutate } = useGeneratedSigninMutation<Error>(client);
  return {
    mutate: useCallback(
      (variables, hooks) => {
        mutate(variables, {
          onSuccess: (data) => {
            hooks.onSuccess(data.signin?.user as Project);
          },
          onError: (error) => {
            handleError(hooks, error);
          },
        });
      },
      [mutate]
    ),
  };
};

export const useGenerateAuthUrlMutation = (): UseMutateResult<string, GenerateAuthUrlMutation> => {
  const { mutate } = useGeneratedGenerateAuthUrlMutation<Error>(client);
  return {
    mutate: useCallback(
      (_, hooks) => {
        mutate(
          {},
          {
            onSuccess: (data) => {
              hooks.onSuccess(data.generateAuthUrl?.url as string);
            },
            onError: (error) => {
              handleError(hooks, error);
            },
          }
        );
      },
      [mutate]
    ),
  };
};
