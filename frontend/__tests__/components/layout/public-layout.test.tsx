import PublicLayout from "@/components/layout/public-layout";
import { render, screen } from "@testing-library/react";

const useWorkspaceIdMock = jest.fn(() => "");

jest.mock("@/module/workspace-id", () => ({ useWorkspaceId: () => useWorkspaceIdMock() }));

describe("PublicLayout", () => {
  test("render", () => {
    render(<PublicLayout>{}</PublicLayout>);
  });

  test("with subdomain", async () => {
    useWorkspaceIdMock.mockImplementationOnce(() => "hoge");
    render(<PublicLayout>{}</PublicLayout>);
    await screen.findByText("404");
  });
});
