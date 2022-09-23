import { useRouter } from "next/router";
import { useWorkspace } from "../../module/api";

export default function Show() {
  const { isReady } = useRouter();

  if (isReady) {
    return <WorkspaceShow />;
  } else {
    return <></>;
  }
}

function WorkspaceShow() {
  const { query } = useRouter();
  const { data: workspace } = useWorkspace(query["workspace-id"] as string);
  return <>{workspace?.name}</>;
}
