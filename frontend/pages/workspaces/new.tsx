import {useForm} from "react-hook-form";
import Button from "../../components/button";
import {FormControl, Input, Label} from "../../components/form";
import Layout from "../../components/layout";
import {useCreateWorkspace} from "../../module/api";
import {toast} from "../../module/toast";

const defaultValues = {workspaceId: "", workspaceName: ""}
export type CraeteWorkspaceParams = typeof defaultValues

export default function New() {
  const createWorkspace = useCreateWorkspace();
  const {register, handleSubmit} = useForm({defaultValues})

  return <Layout>
    <h1 className="text-3xl mb-4">ワークスペース新規作成</h1>

    <form onSubmit={handleSubmit((data) => {
      createWorkspace.mutate(data, {
        onSuccess: () => {
          toast(
            <div className="toast">
              <div className="alert alert-info">
                ワークスペースを作成しました
              </div>
            </div>
          )
        }
      })
    })}>
      <FormControl>
        <Label htmlFor="workspaceId">ワークスペースID</Label>
        <Input id="workspaceId" {...register("workspaceId")} />
      </FormControl>

      <FormControl>
        <Label htmlFor="workspaceName">ワークスペース名</Label>
        <Input id="workspaceName" {...register("workspaceName")} />
      </FormControl>

      <div className="mt-4">
        <Button type="submit">作成</Button>
      </div>
    </form>
  </Layout>
}
