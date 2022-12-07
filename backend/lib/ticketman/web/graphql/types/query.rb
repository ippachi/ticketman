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

          def initialize(*args, organization_query: Gateway::Queries::OrganizationQuery.new,
                         project_query: Gateway::Queries::ProjectQuery.new, **kwargs, &block)
            super(*args, **kwargs, &block)
            @organization_query = organization_query
            @project_query = project_query
          end

          def organization(id:) = @organization_query.find(id)
          def project(id:) = @project_query.find(id)
        end
      end
    end
  end
end
