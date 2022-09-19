import { useForm } from "react-hook-form";
import Button from "../../components/button";
import { FormControl, Input, Label } from "../../components/form";
import Layout from "../../components/layout";
import { useCreateWorkspaceMutation } from "../../module/api";
import { toast } from "../../module/toast";

const defaultValues = { id: "", name: "" };
export type CraeteWorkspaceParams = typeof defaultValues;

export default function New() {
  const createWorkspace = useCreateWorkspaceMutation();
  const { register, handleSubmit } = useForm({ defaultValues });

  return (
    <Layout>
      <h1 className="text-3xl mb-4">ワークスペース新規作成</h1>

      <form
        onSubmit={handleSubmit((data) => {
          createWorkspace.mutate(data, {
            onSuccess: () => {
              toast(
                <div className="toast">
                  <div className="alert alert-info">
                    ワークスペースを作成しました
                  </div>
                </div>
              );
            },
          });
        })}
      >
        <FormControl>
          <Label htmlFor="id">ワークスペースID</Label>
          <Input id="id" {...register("id")} />
        </FormControl>

        <FormControl>
          <Label htmlFor="name">ワークスペース名</Label>
          <Input id="name" {...register("name")} />
        </FormControl>

        <div className="mt-4">
          <Button type="submit">作成</Button>
        </div>
      </form>
    </Layout>
  );
}
