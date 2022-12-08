# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class ProjectFactory
          def self.create(name:, id: ULID.generate)
            Project.new(id:, name:)
          end
        end
      end
    end
  end
end
