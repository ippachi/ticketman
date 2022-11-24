import { useOrganization } from "@/module/api";
import { useOrganizationId } from "@/module/organization-id";
import OrganizationLayout from "@/components/layout/organization-layout";

export default function Dashboard(): JSX.Element {
  const organizationId = useOrganizationId();
  const { data: organization } = useOrganization(organizationId);

  return <OrganizationLayout>{organization?.name}</OrganizationLayout>;
}
