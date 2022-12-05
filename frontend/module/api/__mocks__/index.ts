import { Organization } from "src/generated/graphql";

const useOrganization = (): { data: Organization } => ({
  data: { id: "organization_id", name: "organization name" },
});

export { useOrganization };
