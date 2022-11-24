import OrganizationLayout from "@/components/layout/organization-layout";
import { render, screen } from "@testing-library/react";

const useOrganizationIdMock = jest.fn(() => "hoge");
jest.mock("@/module/organization-id", () => ({ useOrganizationId: () => useOrganizationIdMock() }));
jest.mock("@/module/api");

describe("PublicLayout", () => {
  test("render", () => {
    render(<OrganizationLayout>{}</OrganizationLayout>);
  });

  test("without subdomain", async () => {
    useOrganizationIdMock.mockImplementationOnce(() => "");
    render(<OrganizationLayout>{}</OrganizationLayout>);
    await screen.findByText("404");
  });
});
