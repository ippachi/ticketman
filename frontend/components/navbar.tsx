import { useWorkspace } from "@/module/api";
import { useWorkspaceId } from "@/module/workspace-id";

export default function Navbar(): JSX.Element {
  const workspaceId = useWorkspaceId();
  const { data: workspace } = useWorkspace(workspaceId);

  return (
    <div className="navbar bg-base-100 shadow" data-testid="navbar">
      <a className="btn btn-ghost normal-case text-xl">{workspace?.name}</a>
    </div>
  );
}
