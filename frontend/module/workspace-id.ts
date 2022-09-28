import { createContext, useContext, useEffect, useState } from "react";

const workspaceIdContext = createContext("");

export const WorkspaceIdProvider = workspaceIdContext.Provider;

export const useWorkspaceIdOrNull = (): string | null => {
  const [workspaceId, setWorkspaceId] = useState<string | null>(null);

  useEffect(() => {
    setWorkspaceId(window.location.host.replace(/\.?lvh\.me:3000$/, ""));
  }, []);

  return workspaceId;
};

export const useWorkspaceId = (): string => {
  return useContext(workspaceIdContext);
};
