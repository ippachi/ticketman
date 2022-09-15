# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Workspaces
      extend T::Sig

      sig { params(client: Mongo::Client).void }
      def initialize(client)
        @client = client
      end

      sig { params(id: String).returns(T.nilable(T::Hash[Symbol, T.untyped])) }
      def find(id)
        result = @client[:workspaces].find(id:).first
        result ? result.to_h.transform_keys(&:to_sym).except(:_id) : nil
      end

      sig { params(attributes: T.untyped).void }
      def insert_one(attributes)
        @client[:workspaces].insert_one(attributes)
      end
    end
  end
end
