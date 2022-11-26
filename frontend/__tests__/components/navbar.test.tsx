import Navbar from "@/components/navbar";
import { render, screen } from "@testing-library/react";

const useOrganizationMock = jest.fn();

jest.mock("next/router", () => ({
  useRouter: () => ({ query: { organizationId: "test-org" }, isReady: true }),
}));

jest.mock("@/module/api", () => ({
  useOrganization: (organizationId: string) => useOrganizationMock(organizationId),
}));

describe("Navbar", () => {
  test("render organization name", async () => {
    useOrganizationMock.mockImplementation(() => ({ data: { name: "organization 1" } }));
    render(<Navbar />);
    await screen.findByText("organization 1");
  });
});
