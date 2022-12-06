# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class Project < Entity
          def initialize(id:, name:)
            super(id)
            @name = name
            verify
          end

          def serialize = { **super, name: @name }

          def verify
            raise if @name.empty?
          end
        end
      end
    end
  end
end
