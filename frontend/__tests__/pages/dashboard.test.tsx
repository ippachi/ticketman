import Dashboard from "@/pages/dashboard";
import { render } from "@testing-library/react";

jest.mock("@/module/api");
jest.mock("@/module/organization-id");

describe("Show", () => {
  test("render", () => {
    render(<Dashboard />);
  });
});
