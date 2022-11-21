# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository
      class NotFoundError < StandardError; end

      class DuplicateKeyError < StandardError
        include Application::Errors::DuplicateKeyError
      end

      extend T::Sig
      include Domain::Model::Workspace::WorkspaceRepository

      sig { params(workspaces: Workspaces).void }
      def initialize(workspaces)
        @workspaces = workspaces
      end

      sig { override.params(workspace: Domain::Model::Workspace::Workspace).void }
      def save(workspace)
        @workspaces.insert_one(workspace.serialize)
      rescue Mongo::Error::OperationFailure => e
        raise DuplicateKeyError if e.code == 11_000
      end

      sig { override.params(workspace_id: String).returns(Domain::Model::Workspace::Workspace) }
      def find(workspace_id)
        result = @workspaces.find(workspace_id)
        raise NotFoundError unless result

        Domain::Model::Workspace::WorkspaceFactory.create(**T.unsafe(result))
      end
    end
  end
end
