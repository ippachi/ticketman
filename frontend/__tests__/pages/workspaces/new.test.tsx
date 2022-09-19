import { render, screen, waitFor } from "@testing-library/react";
import New from "../../../pages/workspaces/new";
import userEvent from "@testing-library/user-event";
import "./match-media.mock";
import { useCreateWorkspaceMutation, UseMutateFunction } from "../../../module/api";

const mutateMock = jest.fn();

jest.mock("../../../module/api", () => ({
  useCreateWorkspaceMutation: () => ({
    mutate: mutateMock,
  }),
}));

describe("New", () => {
  test("Create workspace", async () => {
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onSuccess());
    render(<New />);
    await userEvent.type(screen.getByLabelText("workspace ID"), "test_workspace");
    await userEvent.type(screen.getByLabelText("workspace name"), "test workspace");
    await userEvent.click(screen.getByText("Submit"));
    expect(mutateMock).toHaveBeenCalledWith({ id: "test_workspace", name: "test workspace" }, expect.anything());
    await screen.findByText("Workspace created.");
  });

  test("Create workspace with error", async () => {
    mutateMock.mockImplementationOnce((_, hooks) => hooks.onError({ errors: [{ message: "Duplicate ID." }] }));
    render(<New />);
    await userEvent.type(screen.getByLabelText("workspace ID"), "test_workspace");
    await userEvent.type(screen.getByLabelText("workspace name"), "test workspace");
    await userEvent.click(screen.getByText("Submit"));
    await screen.findByText("Duplicate ID.");
  });
});
