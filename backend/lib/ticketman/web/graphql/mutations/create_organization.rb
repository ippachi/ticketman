# frozen_string_literal: true
# typed: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateOrganization < ::GraphQL::Schema::Mutation
          argument :id, ID
          argument :name, String

          field :organization, Types::Organization, null: false

          def resolve(id:, name:)
            organization = Container["application.organization.organization_application_service"].create_organization(
              id, name
            )
            { organization: organization.serialize }
          end
        end
      end
    end
  end
end
