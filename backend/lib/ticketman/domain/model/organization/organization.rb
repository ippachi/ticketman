# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class Organization < Entity
          def initialize(id:, name:, owner_id:)
            super()
            @id = id
            @name = name
            @owner_id = owner_id
            verify
          end

          def create_project(name:) = Project.new(name:)
          def to_h = { id: @id, name: @name, owner_id: @owner_id }

          def verify
            raise if @name.empty? || !@id.to_s.match?(/^[a-z][a-z0-9-]{2,31}$/)
          end
        end
      end
    end
  end
end
