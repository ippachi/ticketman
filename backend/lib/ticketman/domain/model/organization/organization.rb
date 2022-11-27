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
            verify
          end

          sig { params(name: String).returns(Project) }
          def create_project(name:)
            ProjectFactory.create(name:)
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { **super, name: @name }

          sig { void }
          def verify
            raise if @name.empty? || !@id.to_s.match?(/^[a-z][a-z0-9-]{2,31}$/)
          end
        end
      end
    end
  end
end
