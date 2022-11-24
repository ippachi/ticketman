import PublicLayout from "@/components/layout/public-layout";
import { render, screen } from "@testing-library/react";

const useOrganizationIdMock = jest.fn(() => "");

jest.mock("@/module/organization-id", () => ({ useOrganizationId: () => useOrganizationIdMock() }));

describe("PublicLayout", () => {
  test("render", () => {
    render(<PublicLayout>{}</PublicLayout>);
  });

  test("with subdomain", async () => {
    useOrganizationIdMock.mockImplementationOnce(() => "hoge");
    render(<PublicLayout>{}</PublicLayout>);
    await screen.findByText("404");
  });
});
