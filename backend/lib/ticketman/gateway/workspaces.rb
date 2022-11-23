# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Workspaces < Relation
      extend T::Sig

      private

      sig { override.returns(Symbol) }
      def name = :workspaces
    end
  end
end
