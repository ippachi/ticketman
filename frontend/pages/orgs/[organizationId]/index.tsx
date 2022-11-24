import withQuery from "hoc/with-query";

type QueryType = { organizationId: string };

const Index = ({ query }: { query: QueryType }): JSX.Element => {
  return <>{query.organizationId}</>;
};

export default withQuery<QueryType>()(Index);
