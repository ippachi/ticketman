import Navbar from "@/components/navbar";
import { render, screen } from "@testing-library/react";

const useWorkspaceMock = jest.fn();

jest.mock("@/module/api", () => ({
  useWorkspace: (workspaceId: string) => useWorkspaceMock(workspaceId),
}));

jest.mock("@/module/workspace-id");

describe("Navbar", () => {
  test("render workspace name", async () => {
    useWorkspaceMock.mockImplementation(() => ({ data: { name: "workspace 1" } }));
    render(<Navbar />);
    await screen.findByText("workspace 1");
  });
});
