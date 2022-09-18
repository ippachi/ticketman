import {useMutation} from "@tanstack/react-query";

type UseMutateResult<T> = {mutate: UseMutateFunction<T>}
export type UseMutateFunction<T> = (data: T, hooks: {onSuccess: () => void}) => void

export function useCreateWorkspace(): UseMutateResult<{workspaceId: string, workspaceName: string}> {
  return useMutation((createworkspaceParams: {workspaceId: string, workspaceName: string}) => {
    return Promise.resolve({workspaceId: "", workspaceName: ""})
  })
}
