import { useRouter as useRouterNextRouter } from "next/router";

const scheme = process.env.NEXT_PUBLIC_HTTP_SCHEME as string;
const hostname = process.env.NEXT_PUBLIC_HOSTNAME as string;

export const useRouter = (): { push: typeof push } => {
  const { push: nextRouterPush } = useRouterNextRouter();

  const push = async (path: string, options?: { subdomain: string }): Promise<void> => {
    if (options?.subdomain) {
      window.location.href = `${scheme}://${options.subdomain}.${hostname}${path}`;
    } else {
      await nextRouterPush(path);
    }
  };

  return { push };
};
