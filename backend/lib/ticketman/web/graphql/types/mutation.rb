# frozen_string_literal: true
# typed: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Mutation < Types::BaseObject
          field :create_project, mutation: Mutations::CreateProject
          field :create_workspace, mutation: Mutations::CreateWorkspace
        end
      end
    end
  end
end
