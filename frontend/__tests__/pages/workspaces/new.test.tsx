import New from "@/pages/workspaces/new";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import "./match-media.mock";

const mutateMock = jest.fn();
const pushMock = jest.fn();

jest.mock("../../../module/api", () => ({
  useCreateWorkspaceMutation: () => ({ mutate: mutateMock }),
}));

jest.mock("@/module/router", () => ({
  useRouter: () => ({ push: pushMock }),
}));

describe("New", () => {
  test("Create workspace", async () => {
    const workspaceId = "test_workspace";
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onSuccess({ id: workspaceId }));
    render(<New />);

    await userEvent.type(screen.getByLabelText("ID"), workspaceId);
    await userEvent.type(screen.getByLabelText("Name"), "test workspace");
    await userEvent.click(screen.getByText("Submit"));

    expect(mutateMock).toHaveBeenCalledWith({ id: workspaceId, name: "test workspace" }, expect.anything());
    await screen.findByText("Workspace created.");
    expect(pushMock).toHaveBeenCalledWith("/dashboard", { subdomain: workspaceId });
  });

  test("Create workspace with error", async () => {
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onError({ errors: [{ message: "Duplicate ID." }] }));
    render(<New />);
    await userEvent.type(screen.getByLabelText("ID"), "test_workspace");
    await userEvent.type(screen.getByLabelText("Name"), "test workspace");
    await userEvent.click(screen.getByText("Submit"));

    await screen.findByText("Duplicate ID.");
  });

  test("Create workspace validation", async () => {
    render(<New />);
    await userEvent.click(screen.getByText("Submit"));

    await screen.findByText("id must be at least 3 characters");
    await screen.findByText("name is a required field");
  });
});
