import Index from "@/pages/orgs/[organizationId]/index";
import { render, screen } from "@testing-library/react";

jest.mock("next/router", () => ({
  useRouter: () => ({ query: { organizationId: "test-org" }, isReady: true }),
}));

jest.mock("@/module/api");

describe("/orgs/[organizationId]", () => {
  test("Show organization", async () => {
    render(<Index />);
    await screen.findByText("test-org");
  })
})
