import Dashboard from "@/pages/dashboard";
import { render, screen } from "@testing-library/react";

const useWorkspaceMock = jest.fn();

jest.mock("@/module/api", () => ({
  useWorkspace: (workspaceId: string) => useWorkspaceMock(workspaceId),
}));

jest.mock("@/module/workspace-id");

describe("Show", () => {
  test("render", () => {
    useWorkspaceMock.mockImplementation(() => ({ data: { name: "workspace 1" } }));
    render(<Dashboard />);
    expect(useWorkspaceMock).toHaveBeenCalledWith("test");
  });
});
