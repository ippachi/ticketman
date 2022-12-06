# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class OrganizationRepository < Repository
        def initialize(organizations)
          super
          @organizations = organizations
        end

        def build(attributes) = Domain::Model::Organization::OrganizationFactory.create(**attributes)
      end
    end
  end
end
