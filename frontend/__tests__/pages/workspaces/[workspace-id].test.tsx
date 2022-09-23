import { render, screen } from "@testing-library/react";
import Show from "../../../pages/workspaces/[workspace-id]";

const useWorkspaceMock = jest.fn();

jest.mock("../../../module/api", () => ({
  useWorkspace: (workspaceId: string) => useWorkspaceMock(workspaceId),
}));

jest.mock("next/router", () => ({
  useRouter: () => ({ query: { ["workspace-id"]: "test_workspace" }, isReady: true }),
}));

describe("Show", () => {
  it("表示する", async () => {
    useWorkspaceMock.mockImplementation(() => ({ data: { name: "ワークスペース1" } }));
    render(<Show />);
    await screen.findByText("ワークスペース1");
    expect(useWorkspaceMock).toHaveBeenCalled();
  });
});
