/* istanbul ignore file */
import { createContext, useContext, useEffect, useState } from "react";

const hostname = process.env.NEXT_PUBLIC_HOSTNAME as string;
const workspaceIdContext = createContext("");

export const WorkspaceIdProvider = workspaceIdContext.Provider;

// https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions#%E3%82%A8%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%97
const escapeRegExp = (string: string): string => string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

export const useWorkspaceIdOrNull = (): string | null => {
  const [workspaceId, setWorkspaceId] = useState<string | null>(null);

  useEffect(() => {
    const regexp = new RegExp(`\\.?${escapeRegExp(hostname)}$`);
    setWorkspaceId(window.location.host.replace(regexp, ""));
  }, []);

  return workspaceId;
};

export const useWorkspaceId = (): string => {
  return useContext(workspaceIdContext);
};
