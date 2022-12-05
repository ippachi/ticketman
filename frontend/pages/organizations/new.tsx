import { useCreateOrganizationMutation } from "@/module/api";
import { toast } from "@/module/toast";
import CreateorganizationForm from "@/components/forms/create-organization-form";
import { useRouter } from "next/router";
import Layout from "@/components/layout/layout";

export default function New(): JSX.Element {
  const createOrganization = useCreateOrganizationMutation();
  const router = useRouter();

  return (
    <Layout>
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
    </Layout>
  );
}
