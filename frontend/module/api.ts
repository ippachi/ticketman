import { gql, GraphQLClient } from "graphql-request";
import {
  CreateWorkspaceMutationVariables,
  useCreateWorkspaceMutation as useGeneratedCreateWorkspaceMutation,
  useFetchWorkspaceQuery,
  Workspace,
} from "../src/generated/graphql";

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

type UseMutateResult<TData, TVariables> = { mutate: UseMutateFunction<TData, TVariables> };
export type UseMutateFunction<TData, TVariables> = (variables: TVariables, hooks: UseMutateHooks<TData>) => void;
type ErrorResponse = { errors: Array<{ message: string }> };
type UseMutateHooks<TData> = {
  onSuccess: (data: TData) => void;
  onError: (response: ErrorResponse) => void;
};

const client = new GraphQLClient("http://localhost:2300/graphql");

export const useCreateWorkspaceMutation = (): UseMutateResult<Workspace, CreateWorkspaceMutationVariables> => {
  const mutation = useGeneratedCreateWorkspaceMutation<Error>(client);
  return {
    mutate: (variables, hooks) =>
      mutation.mutate(variables, {
        onSuccess: (data) => {
          hooks.onSuccess(data.createWorkspace?.workspace as Workspace);
        },
        onError: (error) => {
          const response = (JSON.parse(JSON.stringify(error)) as { response: unknown }).response as ErrorResponse;
          return hooks.onError(response);
        },
      }),
  };
};

export const useWorkspace = (id: string): { data: Workspace | undefined } => {
  const { data } = useFetchWorkspaceQuery(client, { id });

  return { data: data?.workspace };
};
