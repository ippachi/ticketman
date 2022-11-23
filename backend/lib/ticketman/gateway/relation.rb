# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Relation
      extend T::Sig
      extend T::Helpers

      abstract!

      sig { params(client: Mongo::Client).void }
      def initialize(client)
        @client = client
      end

      sig { params(id: String).returns(T.nilable(T::Hash[Symbol, T.untyped])) }
      def find(id)
        result = @client[name].find(id:).first
        result ? result.to_h.transform_keys(&:to_sym).except(:_id) : nil
      end

      sig { params(attributes: T.untyped).void }
      def insert_one(attributes)
        @client[name].insert_one(attributes)
      end

      private

      sig { abstract.returns(Symbol) }
      def name; end
    end
  end
end
