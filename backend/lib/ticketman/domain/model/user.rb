# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      class User < Entity
        def initialize(name:, id: ULID.generate)
          super()
          @id = id
          @name = name
        end

        def create_organization(id:, name:) = Organization::Organization.new(id:, name:, owner_id: @id)
        def to_h = { id: @id, name: @name }
      end
    end
  end
end
