# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateProject < ::GraphQL::Schema::Mutation
          argument :name, String
          argument :organization_id, ID

          field :project, Types::Project, null: false

          def resolve(organization_id:, name:)
            project = Container["application.organization.organization_application_service"].create_project(
              organization_id:, name:
            )
            { project: project.serialize }
          end
        end
      end
    end
  end
end
