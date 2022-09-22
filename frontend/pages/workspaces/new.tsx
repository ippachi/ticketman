import Layout from "../../components/layout";
import { useCreateWorkspaceMutation } from "../../module/api";
import { toast } from "../../module/toast";
import * as yup from "yup";
import CreateworkspaceForm from "../../components/forms/create-workspace-form";

const schema = yup
  .object({
    id: yup.string().min(3).max(16).matches(new RegExp("^[a-z][a-z0-9_]+$")).required(),
    name: yup.string().required(),
  })
  .required();

export default function New() {
  const createWorkspace = useCreateWorkspaceMutation();

  return (
    <Layout>
      <h1 className="text-3xl mb-4">Create new workspace</h1>

      <CreateworkspaceForm
        onSubmit={(data) => {
          createWorkspace.mutate(data, {
            onSuccess: () => toast("Workspace created.", "success"),
            onError: (error) => toast(error.errors[0].message, "error"),
          });
        }}
      />
    </Layout>
  );
}
