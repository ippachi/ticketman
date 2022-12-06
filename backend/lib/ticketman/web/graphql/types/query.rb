# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Query < ::GraphQL::Schema::Object
          field :organization, Types::Organization, null: false do
            argument :id, String
          end

          field :project, Types::Project, null: false do
            argument :id, String
          end

          def organization(id:) = Container["gateway.organization_query"].find(id)
          def project(id:) = Container["gateway.project_query"].find(id)
        end
      end
    end
  end
end
