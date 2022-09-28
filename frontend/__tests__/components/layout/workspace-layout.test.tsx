import WorkspaceLayout from "@/components/layout/workspace-layout";
import { render, screen } from "@testing-library/react";

const useWorkspaceIdMock = jest.fn(() => "hoge");
jest.mock("@/module/workspace-id", () => ({ useWorkspaceId: () => useWorkspaceIdMock() }));
jest.mock("@/module/api");

describe("PublicLayout", () => {
  test("render", () => {
    render(<WorkspaceLayout>{}</WorkspaceLayout>);
  });

  test("without subdomain", async () => {
    useWorkspaceIdMock.mockImplementationOnce(() => "");
    render(<WorkspaceLayout>{}</WorkspaceLayout>);
    await screen.findByText("404");
  });
});
