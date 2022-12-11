import { Organization } from "src/gql/graphql";

const useOrganization = (): { data: Organization } => ({
  data: { id: "organization_id", name: "organization name" },
});

export { useOrganization };
