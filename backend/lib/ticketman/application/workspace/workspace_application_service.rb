# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module Workspace
      class WorkspaceApplicationService
        extend T::Sig

        sig { params(workspace_repo: Domain::Model::Workspace::WorkspaceRepository).void }
        def initialize(workspace_repo:)
          @workspace_repo = workspace_repo
        end

        sig { params(id: String, name: String).returns(Domain::Model::Workspace::Workspace) }
        def create_workspace(id, name)
          workspace = Domain::Model::Workspace::WorkspaceFactory.new.create(id:, name:)
          @workspace_repo.save(workspace)
          workspace
        end
      end
    end
  end
end
