import {render, screen, waitFor} from "@testing-library/react"
import New from "../../../pages/workspaces/new"
import userEvent from "@testing-library/user-event"
import "./match-media.mock"
import {useCreateWorkspace, UseMutateFunction} from "../../../module/api"

const mutateMock = jest.fn()

jest.mock("../../../module/api", () => ({
  useCreateWorkspace: () => ({
    mutate: ((data, hooks) => {
      mutateMock(data, hooks)
      hooks.onSuccess()
    }) as UseMutateFunction<ReturnType<typeof useCreateWorkspace>>
  })
}))

describe("New", () => {
  it("ワークスペースを作成する", async () => {
    render(<New />)
    await userEvent.type(screen.getByLabelText("ワークスペースID"), "test_workspace")
    await userEvent.type(screen.getByLabelText("ワークスペース名"), "test workspace")
    await userEvent.click(screen.getByText("作成"))
    expect(mutateMock).toHaveBeenCalledWith({workspaceId: "test_workspace", workspaceName: "test workspace"}, expect.anything())
    await screen.findByText("ワークスペースを作成しました")
  })
})
