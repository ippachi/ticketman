# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      module Organization
        class OrganizationFactory
          def self.create(id:, name:)
            Organization.new(id:, name:)
          end
        end
      end
    end
  end
end
