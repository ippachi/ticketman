/* istanbul ignore file */
import { useRouter } from "next/router";
import { createContext } from "react";

const organizationIdContext = createContext("");

export const OrganizationIdProvider = organizationIdContext.Provider;

export const useOrganizationId = (): string => {
  const { query } = useRouter();
  return query.organizationId as string;
};
