# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      class Entity
        attr_reader :id

        def initialize(id)
          @id = id
        end

        def serialize = { id: @id }
      end
    end
  end
end
