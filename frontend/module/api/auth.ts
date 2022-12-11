import { SigninMutationVariables } from "src/gql/graphql";
import { graphql } from "../../src/gql";
import { UseMutationResult, useBaseMutation } from "./utils";

const signinDocument = graphql(`
  mutation signin($code: String!, $state: String!) {
    signin(code: $code, state: $state) {
      user {
        name
      }
    }
  }
`);

const generateAuthUrlDocument = graphql(`
  mutation generateAuthUrl {
    generateAuthUrl {
      url
    }
  }
`);

export const useSigninMutation = (): UseMutationResult<SigninMutationVariables, null> => {
  return useBaseMutation(signinDocument, (data) => data.signin?.user as null);
};

export const useGenerateAuthUrlMutation = (): UseMutationResult<Record<string, never>, string> => {
  return useBaseMutation(generateAuthUrlDocument, (data) => data.generateAuthUrl?.url as string);
};
