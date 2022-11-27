# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Organization
        class Project < Entity
          sig { params(id: ProjectID, name: String).void }
          def initialize(id:, name:)
            super(id)
            @name = name
            verify
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { **super, name: @name }

          sig { void }
          def verify
            raise if @name.empty?
          end
        end
      end
    end
  end
end
