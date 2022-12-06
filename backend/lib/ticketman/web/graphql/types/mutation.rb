# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Mutation < Types::BaseObject
          field :create_organization, mutation: Mutations::CreateOrganization
          field :create_project, mutation: Mutations::CreateProject
          field :signin, mutation: Mutations::Signin
          field :generate_auth_url, mutation: Mutations::GenerateAuthUrl
        end
      end
    end
  end
end
