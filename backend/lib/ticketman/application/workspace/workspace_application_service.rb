# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module Workspace
      class WorkspaceApplicationService
        class CreateWorkspaceDuplicateIDError < Error; end

        extend T::Sig

        sig { params(workspace_repo: Domain::Model::Workspace::WorkspaceRepository).void }
        def initialize(workspace_repo:)
          @workspace_repo = workspace_repo
        end

        sig { params(id: String, name: String).returns(Domain::Model::Workspace::Workspace) }
        def create_workspace(id, name)
          workspace = Domain::Model::Workspace::WorkspaceFactory.new.create(id:, name:)
          begin
            @workspace_repo.save(workspace)
          rescue Errors::DuplicateKeyError
            raise CreateWorkspaceDuplicateIDError, "Duplicate ID."
          end
          workspace
        end
      end
    end
  end
end
