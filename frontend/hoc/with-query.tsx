import { useRouter } from "next/router";
import { useEffect, useState } from "react";

const withQuery = <QueryType extends Record<string, string>>() => {
  return <OriginalProps extends Record<string, unknown>>(
    WrappedComponent: React.ComponentType<OriginalProps & { query: QueryType }>
  ): ((props: OriginalProps) => JSX.Element) => {
    const WithQuery = (props: OriginalProps): JSX.Element => {
      const { query, isReady } = useRouter();
      const [ready, setReady] = useState(isReady);

      useEffect(() => {
        setReady(isReady);
      }, [isReady]);

      return ready ? <WrappedComponent query={query as QueryType} {...props} /> : <></>;
    };
    return WithQuery;
  };
};

export default withQuery;
