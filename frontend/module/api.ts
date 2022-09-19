import { gql, GraphQLClient } from "graphql-request";
import { CreateWorkspaceMutationVariables, useCreateWorkspaceMutation as useGeneratedCreateWorkspaceMutation } from "../src/generated/graphql";

gql`
  mutation createWorkspace($id: ID!, $name: String!) {
    createWorkspace(id: $id, name: $name) {
      workspace {
        id
        name
      }
    }
  }
`;

type UseMutateResult<T> = { mutate: UseMutateFunction<T> }
export type UseMutateFunction<T> = (data: T, hooks: UseMutateHooks) => void
type UseMutateHooks = {
  onSuccess: () => void
}

const client = new GraphQLClient("http://localhost:2300/graphql")

export const useCreateWorkspaceMutation = (): UseMutateResult<CreateWorkspaceMutationVariables> => {
  return useGeneratedCreateWorkspaceMutation(client);
};
