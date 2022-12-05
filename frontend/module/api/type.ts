export type UseMutateResult<TData, TVariables> = {
  mutate: (
    variables: TVariables,
    hooks: {
      onSuccess: (data: TData) => void;
      onError?: OnError;
    }
  ) => void;
};
export type OnError = (response: ErrorResponse) => void;
export type ErrorResponse = { errors: Array<{ message: string; extensions: { code: string } }> };
