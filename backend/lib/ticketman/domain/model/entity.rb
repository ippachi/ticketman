# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      class Entity
        extend T::Sig
        extend T::Generic

        abstract!

        sig { returns(Identifier) }
        attr_reader :id

        sig { params(id: Identifier).void }
        def initialize(id)
          @id = id
        end

        sig { returns(T::Hash[Symbol, T.untyped]) }
        def serialize = { id: @id.serialize }
      end
    end
  end
end
