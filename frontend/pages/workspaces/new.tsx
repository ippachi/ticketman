import { useRouter } from "next/router";
import { useCreateWorkspaceMutation } from "@/module/api";
import { toast } from "@/module/toast";
import CreateworkspaceForm from "@/components/forms/create-workspace-form";
import PublicLayout from "@/components/layout/public-layout";

export default function New() {
  const createWorkspace = useCreateWorkspaceMutation();
  const router = useRouter();

  return (
    <PublicLayout>
      <h1 className="text-3xl mb-4">Create new workspace</h1>

      <CreateworkspaceForm
        onSubmit={(data) => {
          createWorkspace.mutate(data, {
            onSuccess: () => {
              toast("Workspace created.", "success");
              router.push(`/workspaces/${data.id}`);
            },
            onError: (error) => toast(error.errors[0].message, "error"),
          });
        }}
      />
    </PublicLayout>
  );
}
