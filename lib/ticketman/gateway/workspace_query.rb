# typed: strict

require "mongo"

module Ticketman
  module Gateway
    class WorkspaceQuery
      extend T::Sig
      include Web::WorkspaceQuery

      sig { params(client: Mongo::Client).void }
      def initialize(client)
        @client = client
      end

      sig { override.params(id: String).returns(T.untyped) }
      def find(id)
        @client[:workspaces].find(id:).first.except(:_id)
      end
    end
  end
end
