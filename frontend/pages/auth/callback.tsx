import { useSigninMutation } from "@/module/api";
import { toast } from "@/module/toast";
import withQuery from "hoc/with-query";
import { useRouter } from "next/router";
import { useEffect } from "react";

type QueryType = {
  code: string,
  state: string
}

const Callback = ({ query }: { query: QueryType }): JSX.Element => {
  const { mutate } = useSigninMutation();
  const router = useRouter();

  useEffect(() => {
    mutate(query, {
      onSuccess: () => {
        toast("Sign-in successful", "success")
        void router.push("/")
      },
      onError: () => {
        toast("Login failed", "error")
        void router.push("/")
      }
    })
  }, [query, mutate, router])
  return <></>;
};

export default withQuery<QueryType>()(Callback);
