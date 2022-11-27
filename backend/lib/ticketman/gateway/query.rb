# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Query
      class NotFoundError < Web::Query::Errors::NotFoundError; end

      extend T::Sig
      extend T::Helpers

      abstract!

      sig { params(relation: Relation).void }
      def initialize(relation)
        @relation = relation
      end

      sig { params(id: String).returns(T.untyped) }
      def find(id)
        result = @relation.find(id)
        raise NotFoundError unless result

        result
      end
    end
  end
end
