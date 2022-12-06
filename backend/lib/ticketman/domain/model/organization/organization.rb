# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class Organization < Entity
          def initialize(id:, name:)
            super(id)
            @name = name
            verify
          end

          def create_project(name:)
            ProjectFactory.create(name:)
          end

          def serialize = { **super, name: @name }

          def verify
            raise if @name.empty? || !@id.to_s.match?(/^[a-z][a-z0-9-]{2,31}$/)
          end
        end
      end
    end
  end
end
