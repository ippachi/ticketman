# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Mutation < Types::BaseObject
          field :create_organization, mutation: Mutations::CreateOrganization
          field :create_project, mutation: Mutations::CreateProject
          field :generate_auth_url, mutation: Mutations::GenerateAuthUrl
          field :signin, mutation: Mutations::Signin
        end
      end
    end
  end
end
