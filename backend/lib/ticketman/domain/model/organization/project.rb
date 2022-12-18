# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class Project < Entity
          def initialize(name:, id: ULID.generate)
            super()
            @id = id
            @name = name
            verify
          end

          def to_h = { id: @id, name: @name }

          def verify
            raise if @name.empty?
          end
        end
      end
    end
  end
end
