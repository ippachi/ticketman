# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Organization
        class OrganizationFactory
          extend T::Sig

          sig { params(id: String, name: String).returns(Organization) }
          def self.create(id:, name:)
            Organization.new(id: Ticketman::Domain::Model::Organization::OrganizationID.new(id), name:)
          end
        end
      end
    end
  end
end
