/* istanbul ignore file */
import { createContext, useContext, useEffect, useState } from "react";

const hostname = process.env.NEXT_PUBLIC_HOSTNAME as string;
const organizationIdContext = createContext("");

export const OrganizationIdProvider = organizationIdContext.Provider;

// https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions#%E3%82%A8%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%97
const escapeRegExp = (string: string): string => string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

export const useOrganizationIdOrNull = (): string | null => {
  const [organizationId, setOrganizationId] = useState<string | null>(null);

  useEffect(() => {
    const regexp = new RegExp(`\\.?${escapeRegExp(hostname)}$`);
    setOrganizationId(window.location.host.replace(regexp, ""));
  }, []);

  return organizationId;
};

export const useOrganizationId = (): string => {
  return useContext(organizationIdContext);
};
