import { render, screen } from "@testing-library/react";
import New from "../../../pages/workspaces/new";
import userEvent from "@testing-library/user-event";
import "./match-media.mock";

const mutateMock = jest.fn();
const pushMock = jest.fn();

jest.mock("../../../module/api", () => ({
  useCreateWorkspaceMutation: () => ({ mutate: mutateMock }),
}));

jest.mock("next/router", () => ({
  useRouter: () => ({ push: pushMock }),
}));

describe("New", () => {
  test("Create workspace", async () => {
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onSuccess());
    render(<New />);
    await userEvent.type(screen.getByLabelText("ID"), "test_workspace");
    await userEvent.type(screen.getByLabelText("Name"), "test workspace");
    await userEvent.click(screen.getByText("Submit"));
    expect(mutateMock).toHaveBeenCalledWith({ id: "test_workspace", name: "test workspace" }, expect.anything());
    await screen.findByText("Workspace created.");
    expect(pushMock).toHaveBeenCalledWith("/workspaces/test_workspace");
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
