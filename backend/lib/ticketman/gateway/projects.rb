# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Projects < Relation
      extend T::Sig

      private

      sig { override.returns(Symbol) }
      def name = :projects
    end
  end
end
