import Dashboard from "@/pages/dashboard";
import { render, screen } from "@testing-library/react";

const useWorkspaceMock = jest.fn();

jest.mock("../../module/api", () => ({
  useWorkspace: (workspaceId: string) => useWorkspaceMock(workspaceId),
}));

jest.mock("../../module/workspace-id");

describe("Show", () => {
  it("表示する", async () => {
    useWorkspaceMock.mockImplementation(() => ({ data: { name: "ワークスペース1" } }));
    render(<Dashboard />);
    await screen.findByText("ワークスペース1");
    expect(useWorkspaceMock).toHaveBeenCalledWith("test");
  });
});
