# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository
      class NotFoundError < StandardError; end

      extend T::Sig
      include Domain::Model::Workspace::WorkspaceRepository

      sig { params(workspaces: Workspaces).void }
      def initialize(workspaces)
        @workspaces = workspaces
      end

      sig { params(workspace: Domain::Model::Workspace::Workspace).void }
      def save(workspace)
        @workspaces.insert_one(workspace.serialize)
      end

      sig { params(workspace_id: String).returns(Domain::Model::Workspace::Workspace) }
      def find(workspace_id)
        result = @workspaces.find(workspace_id)
        raise NotFoundError unless result

        Domain::Model::Workspace::WorkspaceFactory.new.create(**T.unsafe(result))
      end
    end
  end
end
