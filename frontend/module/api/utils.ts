import { GraphQLClient } from "graphql-request";
import { ErrorResponse, OnError } from "./type";

export const handleError = (hooks: { onError?: OnError }, error: Error) => {
  const response = JSON.parse(JSON.stringify(error)).response as ErrorResponse;
  if (hooks.onError) hooks.onError(response);
}

export const client = new GraphQLClient("http://localhost:2300/graphql", { credentials: "include" });
