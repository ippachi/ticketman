# frozen_string_literal: true
# typed: false

module Ticketman
  module Web
    module GraphQL
      module Types
        class Query < ::GraphQL::Schema::Object
          extend T::Sig

          field :organization, Types::Organization, null: false do
            argument :id, ID
          end

          field :project, Types::Project, null: false do
            argument :id, ID
          end

          def organization(id:) = Container["gateway.organization_query"].find(id)
          def project(id:) = Container["gateway.project_query"].find(id)
        end
      end
    end
  end
end
