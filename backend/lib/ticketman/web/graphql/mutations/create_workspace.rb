# frozen_string_literal: true
# typed: true

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class CreateWorkspace < ::GraphQL::Schema::Mutation
          argument :id, ID
          argument :name, String

          field :workspace, Types::Workspace, null: false

          def resolve(id:, name:)
            workspace = Container["application.workspace.workspace_application_service"].create_workspace(id, name)
            { workspace: workspace.serialize }
          end
        end
      end
    end
  end
end
