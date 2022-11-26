import OrganizationLayout from "@/components/layout/organization-layout";
import withQuery from "hoc/with-query";

type QueryType = { organizationId: string };

const Index = ({ query }: { query: QueryType }): JSX.Element => {
  return <OrganizationLayout>{query.organizationId}</OrganizationLayout>;
};

export default withQuery<QueryType>()(Index);
