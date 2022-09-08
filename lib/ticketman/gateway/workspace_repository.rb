# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository
      extend T::Sig

      sig { void }
      def initialize
        @client = T.let(Mongo::Client.new(["127.0.0.1:27017"], user: "ticketman", password: "password", database: "ticketmanTestDB"), Mongo::Client)
      end

      sig { params(attributes: T.untyped).void }
      def save(attributes)
        @client[:workspaces].insert_one(attributes)
      end
    end
  end
end
