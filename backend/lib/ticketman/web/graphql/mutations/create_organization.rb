# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateOrganization < ::GraphQL::Schema::Mutation
          argument :id, ID
          argument :name, String

          field :organization, Types::Organization, null: false

          def initialize(*args, application_service: Application::Organization::OrganizationApplicationService.new,
                         **kwargs, &block)
            super(*args, **kwargs, &block)
            @application_service = application_service
          end

          def resolve(id:, name:)
            organization = @application_service.create_organization(id, name)
            { organization: organization.to_h }
          end
        end
      end
    end
  end
end
