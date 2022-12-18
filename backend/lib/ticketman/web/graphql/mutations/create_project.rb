# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateProject < ::GraphQL::Schema::Mutation
          argument :name, String
          argument :organization_id, ID

          field :project, Types::Project, null: false

          def initialize(*args, application_service: Application::Organization::OrganizationApplicationService.new,
                         **kwargs, &block)
            super(*args, **kwargs, &block)
            @application_service = application_service
          end

          def resolve(organization_id:, name:)
            project = @application_service.create_project(context[:current_user], organization_id:, name:)
            { project: project.to_h }
          end
        end
      end
    end
  end
end
