import {useMutation} from "@tanstack/react-query";
import {request, gql} from 'graphql-request'
import {useWorkspaceQuery} from "../src/generated/graphql";

type UseMutateResult<T> = {mutate: UseMutateFunction<T>}
export type UseMutateFunction<T> = (data: T, hooks: {onSuccess: () => void}) => void

const workspaceQuery = gql`
  query Workspace($id: String!) {
    workspace(id: $id) {
      id
      name
    }
  }
`

const createWorkspaceMutation = gql`
  mutation createWorkspace($id: ID!, $name: String!) {
    createWorkspace(id: $id, name: $name) {
      workspace {
        id
        name
      }
    }
  }
`

export function useCreateWorkspace(): UseMutateResult<{workspaceId: string, workspaceName: string}> {
  return useMutation((createworkspaceParams: {workspaceId: string, workspaceName: string}) => {
    return Promise.resolve({workspaceId: "", workspaceName: ""})
  })
}
