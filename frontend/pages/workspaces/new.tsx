import { useCreateWorkspaceMutation } from "@/module/api";
import { toast } from "@/module/toast";
import CreateworkspaceForm from "@/components/forms/create-workspace-form";
import PublicLayout from "@/components/layout/public-layout";
import { useRouter } from "@/module/router";

export default function New(): JSX.Element {
  const createWorkspace = useCreateWorkspaceMutation();
  const router = useRouter();

  return (
    <PublicLayout>
      <h1 className="text-3xl mb-4">Create new workspace</h1>

      <CreateworkspaceForm
        onSubmit={(data): void => {
          createWorkspace.mutate(data, {
            onSuccess: async (workspace) => {
              toast("Workspace created.", "success");
              await router.push("/dashboard", { subdomain: workspace.id });
            },
            onError: (error) => toast(error.errors[0].message, "error"),
          });
        }}
      />
    </PublicLayout>
  );
}
