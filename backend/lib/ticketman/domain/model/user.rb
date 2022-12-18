# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      class User < Entity
        def initialize(id: ULID.generate, name: nil)
          super()
          @id = id
          @name = "name" # TODO
        end

        def to_h = { id: @id, name: @name }
      end
    end
  end
end
