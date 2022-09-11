# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository
      extend T::Sig

      sig { params(client: Mongo::Client).void }
      def initialize(client)
        @client = client
      end

      sig { params(workspace: Domain::Model::Workspace::Workspace).void }
      def save(workspace)
        @client[:workspaces].insert_one(workspace.serialize)
      end
    end
  end
end
