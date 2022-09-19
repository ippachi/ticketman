# typed: true
# frozen_string_literal: true

module Ticketman
  module Application
    class WorkspaceTest < Test::Unit::TestCase
      def teardown
        Ticketman::Container["gateway.mongo_client"].collections.each(&:delete_many)
      end

      def test_create_workspace
        Container["application.workspace.workspace_application_service"].create_workspace("hoge", "name")
        assert Container["gateway.workspace_repo"].find("hoge")
      end

      def test_create_workspace_with_duplicate_id
        Container["application.workspace.workspace_application_service"].create_workspace("hoge", "name")
        assert_raises Workspace::WorkspaceApplicationService::CreateWorkspaceDuplicateIDError do
          Container["application.workspace.workspace_application_service"].create_workspace("hoge", "name")
        end
      end
    end
  end
end
