import { Workspace } from "src/generated/graphql";

const useWorkspace = (): Workspace => ({ id: "workspace_id", name: "workspace name" });

export { useWorkspace };
