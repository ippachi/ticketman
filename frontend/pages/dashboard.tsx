import { useWorkspace } from "@/module/api";
import { useWorkspaceId } from "@/module/workspace-id";
import WorkspaceLayout from "@/components/layout/workspace-layout";

export default function Dashboard(): JSX.Element {
  const workspaceId = useWorkspaceId();
  const { data: workspace } = useWorkspace(workspaceId);

  return <WorkspaceLayout>{workspace?.name}</WorkspaceLayout>;
}
