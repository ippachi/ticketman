# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Organization
        class Organization < Entity
          sig { params(id: OrganizationID, name: String).void }
          def initialize(id:, name:)
            super(id)
            @name = name
          end

          sig { params(name: String).returns(Project) }
          def create_project(name:)
            ProjectFactory.create(name:)
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { **super, name: @name }
        end
      end
    end
  end
end
