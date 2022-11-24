# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Organizations < Relation
      extend T::Sig

      private

      sig { override.returns(Symbol) }
      def name = :organizations
    end
  end
end
