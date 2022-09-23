import { gql, GraphQLClient } from "graphql-request";
import {
  CreateWorkspaceMutationVariables,
  useCreateWorkspaceMutation as useGeneratedCreateWorkspaceMutation,
  useFetchWorkspaceQuery,
} from "../src/generated/graphql";
import { Workspace } from "./models";

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

gql`
  query fetchWorkspace($id: String!) {
    workspace(id: $id) {
      id
      name
    }
  }
`;

type UseMutateResult<T> = { mutate: UseMutateFunction<T> };
export type UseMutateFunction<T> = (data: T, hooks: UseMutateHooks) => void;
type UseMutateHooks = {
  onSuccess?: () => void;
  onError?: (response: { errors: Array<{ message: string }> }) => void;
};

const client = new GraphQLClient("http://localhost:2300/graphql");

export const useCreateWorkspaceMutation = (): UseMutateResult<CreateWorkspaceMutationVariables> => {
  const mutation = useGeneratedCreateWorkspaceMutation<Error>(client);
  return {
    mutate: (variables, hooks) =>
      mutation.mutate(variables, {
        onSuccess: hooks.onSuccess,
        onError: (error) => {
          if (hooks.onError) return hooks.onError(JSON.parse(JSON.stringify(error)).response);
        },
      }),
  };
};

export const useWorkspace = (id: string) => {
  const { data } = useFetchWorkspaceQuery(client, { id });

  return {
    data: data?.workspace as Workspace | undefined,
  };
};
