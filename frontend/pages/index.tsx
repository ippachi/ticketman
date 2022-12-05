import Button from "@/components/button";
import { useGenerateAuthUrlMutation } from "@/module/api";
import { toast } from "@/module/toast";
import type { NextPage } from "next";

const Home: NextPage = () => {
  const { mutate } = useGenerateAuthUrlMutation();
  return (
    <>
      <Button
        onClick={(): void => {
          mutate(
            {},
            {
              onSuccess: (data: string) => {
                location.href = data;
              },
              onError: () => {
                toast("Problem has occurred.", "error")
              }
            }
          );
        }}
      >
        Sign-in
      </Button>
    </>
  );
};

export default Home;
