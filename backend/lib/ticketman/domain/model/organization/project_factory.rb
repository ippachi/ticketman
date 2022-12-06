# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class ProjectFactory
          def self.create(name:, id: nil)
            Project.new(id: id || ULID.generate, name:)
          end
        end
      end
    end
  end
end
