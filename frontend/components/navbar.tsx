import { useOrganization } from "@/module/api";
import { useOrganizationId } from "@/module/organization-id";

export default function Navbar(): JSX.Element {
  const organizationId = useOrganizationId();
  const { data: organization } = useOrganization(organizationId);

  return (
    <div className="navbar bg-base-100 shadow" data-testid="navbar">
      <a className="btn btn-ghost normal-case text-xl">{organization?.name}</a>
    </div>
  );
}
