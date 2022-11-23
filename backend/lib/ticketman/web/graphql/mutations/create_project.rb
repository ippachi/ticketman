# frozen_string_literal: true
# typed: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateProject < ::GraphQL::Schema::Mutation
          argument :name, String
          argument :workspace_id, ID

          field :project, Types::Project, null: false

          def resolve(workspace_id:, name:)
            project = Container["application.workspace.workspace_application_service"].create_project(
              workspace_id:, name:
            )
            { project: project.serialize }
          end
        end
      end
    end
  end
end
