# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Organization
        module OrganizationRepository
          extend T::Sig
          extend T::Helpers

          interface!

          sig { abstract.params(organization: Organization).void }
          def save(organization); end

          sig { abstract.params(organization_id: String).returns(Organization) }
          def find(organization_id); end
        end
      end
    end
  end
end
