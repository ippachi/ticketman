# typed: true
# frozen_string_literal: true

module Ticketman
  module Application
    module Workspace
      class WorkspaceApplicationServiceTest < TestCase
        def teardown
          Ticketman::Container["gateway.mongo_client"].collections.each(&:delete_many)
        end

        def test_create_workspace
          create_workspace
          assert Container["gateway.workspace_repo"].find("hoge")
        end

        def test_create_workspace_with_duplicate_id
          create_workspace
          assert_raises Workspace::WorkspaceApplicationService::CreateWorkspaceDuplicateIDError do
            create_workspace
          end
        end

        def test_create_project
          workspace = create_workspace
          project =
            Container["application.workspace.workspace_application_service"].create_project(workspace_id: workspace.id.to_s,
                                                                                            name: "hoge project")
          assert Container["gateway.project_repo"].find(project.id)
        end

        private

        def create_workspace
          Container["application.workspace.workspace_application_service"].create_workspace("hoge", "name")
        end
      end
    end
  end
end
