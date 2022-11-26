import { useCreateOrganizationMutation } from "@/module/api";
import { toast } from "@/module/toast";
import CreateorganizationForm from "@/components/forms/create-organization-form";
import PublicLayout from "@/components/layout/public-layout";
import { useRouter } from "next/router";

export default function New(): JSX.Element {
  const createOrganization = useCreateOrganizationMutation();
  const router = useRouter();

  return (
    <PublicLayout>
      <h1 className="text-3xl mb-4">Create new organization</h1>

      <CreateorganizationForm
        onSubmit={(data): void => {
          createOrganization.mutate(data, {
            onSuccess: (organization) => {
              toast("Organization created.", "success");
              void router.push(`/orgs/${organization.id}`);
            },
            onError: (error) => toast(error.errors[0].message, "error"),
          });
        }}
      />
    </PublicLayout>
  );
}
