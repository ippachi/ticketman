import { useOrganization } from "@/module/api";
import withQuery from "hoc/with-query";

type QueryType = { organizationId: string }

const Navbar = ({ query }: { query: QueryType }): JSX.Element => {
  const { data: organization } = useOrganization(query.organizationId, { useErrorBoundary: true });

  return (
    <div className="navbar bg-base-100 shadow" data-testid="navbar">
      <a className="btn btn-ghost normal-case text-xl">{organization?.name}</a>
    </div>
  );
}

export default withQuery<QueryType>()(Navbar);
