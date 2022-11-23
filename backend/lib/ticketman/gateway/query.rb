# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Query
      extend T::Sig
      extend T::Helpers

      abstract!

      sig { params(relation: Relation).void }
      def initialize(relation)
        @relation = relation
      end

      sig { params(id: String).returns(T.untyped) }
      def find(id)
        @relation.find(id)
      end
    end
  end
end
