import { useQuery } from "@tanstack/react-query";
import { CreateOrganizationMutationVariables, Organization } from "src/gql/graphql";
import { graphql } from "../../src/gql";
import { client, UseMutationResult, useBaseMutation } from "./utils";

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
