import New from "@/pages/organizations/new";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";

const mutateMock = jest.fn();
const pushMock = jest.fn();

jest.mock("../../../module/api", () => ({
  useCreateOrganizationMutation: () => ({ mutate: mutateMock }),
}));

jest.mock("next/router", () => ({
  useRouter: () => ({ push: pushMock }),
}));

describe("New", () => {
  test("Create organization", async () => {
    const organizationId = "test_organization";
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onSuccess({ id: organizationId }));
    render(<New />);

    await userEvent.type(screen.getByLabelText("ID"), organizationId);
    await userEvent.type(screen.getByLabelText("Name"), "test organization");
    await userEvent.click(screen.getByText("Submit"));

    expect(mutateMock).toHaveBeenCalledWith({ id: organizationId, name: "test organization" }, expect.anything());
    await screen.findByText("Organization created.");
    expect(pushMock).toHaveBeenCalledWith(`/orgs/${organizationId}`);
  });

  test("Create organization with error", async () => {
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onError({ errors: [{ message: "Duplicate ID." }] }));
    render(<New />);
    await userEvent.type(screen.getByLabelText("ID"), "test_organization");
    await userEvent.type(screen.getByLabelText("Name"), "test organization");
    await userEvent.click(screen.getByText("Submit"));

    await screen.findByText("Duplicate ID.");
  });

  test("Create organization validation", async () => {
    render(<New />);
    await userEvent.click(screen.getByText("Submit"));

    await screen.findByText("id must be at least 3 characters");
    await screen.findByText("name is a required field");
  });
});
