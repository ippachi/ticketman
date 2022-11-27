import { gql, GraphQLClient } from "graphql-request";
import {
  CreateOrganizationMutationVariables,
  useCreateOrganizationMutation as useGeneratedCreateOrganizationMutation,
  useFetchOrganizationQuery,
  Organization,
} from "../src/generated/graphql";

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

type UseMutateResult<TData, TVariables> = { mutate: UseMutateFunction<TData, TVariables> };
export type UseMutateFunction<TData, TVariables> = (variables: TVariables, hooks: UseMutateHooks<TData>) => void;
type ErrorResponse = { errors: Array<{ message: string; extensions: { code: string } }> };
type UseMutateHooks<TData> = {
  onSuccess: (data: TData) => void;
  onError: (response: ErrorResponse) => void;
};

const client = new GraphQLClient("http://localhost:2300/graphql");

export const useCreateOrganizationMutation = (): UseMutateResult<Organization, CreateOrganizationMutationVariables> => {
  const mutation = useGeneratedCreateOrganizationMutation<Error>(client);
  return {
    mutate: (variables, hooks) =>
      mutation.mutate(variables, {
        onSuccess: (data) => {
          hooks.onSuccess(data.createOrganization?.organization as Organization);
        },
        onError: (error) => {
          const response = (JSON.parse(JSON.stringify(error)) as { response: unknown }).response as ErrorResponse;
          return hooks.onError(response);
        },
      }),
  };
};

export const useOrganization = (
  id: string,
  options: { useErrorBoundary: boolean } = { useErrorBoundary: false }
): { data: Organization | undefined; isLoading: boolean; errorCode: string | null } => {
  const { data, isLoading, error } = useFetchOrganizationQuery(client, { id }, options);
  const errorCode = (error as { response: ErrorResponse })?.response.errors[0].extensions.code;

  return { data: data?.organization, isLoading, errorCode };
};
