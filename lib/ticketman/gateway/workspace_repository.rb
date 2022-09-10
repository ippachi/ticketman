# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository
      extend T::Sig

      sig { params(client: Mongo::Client).void }
      def initialize(client)
        @client = client
      end

      sig { params(attributes: T.untyped).void }
      def save(attributes)
        @client[:workspaces].insert_one(attributes)
      end
    end
  end
end
