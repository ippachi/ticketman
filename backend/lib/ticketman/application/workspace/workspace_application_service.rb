# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module Workspace
      class WorkspaceApplicationService
        class CreateWorkspaceDuplicateIDError < Error; end

        extend T::Sig

        sig do
          params(
            workspace_repo: Domain::Model::Workspace::WorkspaceRepository,
            project_repo: Domain::Model::Workspace::ProjectRepository,
          ).void
        end
        def initialize(workspace_repo:, project_repo:)
          @workspace_repo = workspace_repo
          @project_repo = project_repo
        end

        sig { params(id: String, name: String).returns(Domain::Model::Workspace::Workspace) }
        def create_workspace(id, name)
          workspace = Domain::Model::Workspace::WorkspaceFactory.create(id:, name:)
          begin
            @workspace_repo.save(workspace)
          rescue Errors::DuplicateKeyError
            raise CreateWorkspaceDuplicateIDError, "Duplicate ID."
          end
          workspace
        end

        sig { params(workspace_id: String, name: String).returns(Domain::Model::Workspace::Project) }
        def create_project(workspace_id:, name:)
          workspace = @workspace_repo.find(workspace_id)
          project = workspace.create_project(name:)
          @project_repo.save(project)
          project
        end
      end
    end
  end
end
