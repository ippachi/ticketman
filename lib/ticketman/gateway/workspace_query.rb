# typed: strict

require_relative "../web"
require "mongo"

module Ticketman
  module Gateway
    class WorkspaceQuery
      extend T::Sig
      include Web::WorkspaceQuery

      sig { void }
      def initialize
        @client = T.let(Mongo::Client.new(["127.0.0.1:27017"], user: "ticketman", password: "password", database: "ticketmanTestDB"), Mongo::Client)
      end

      sig { override.params(id: String).returns(T.untyped) }
      def find(id)
        @client[:workspaces].find(id:).first.except(:_id)
      end
    end
  end
end
