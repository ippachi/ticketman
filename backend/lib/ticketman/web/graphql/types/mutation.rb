# frozen_string_literal: true
# typed: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Mutation < Types::BaseObject
          field :create_workspace, mutation: Mutations::CreateWorkspace
          field :create_project, mutation: Mutations::CreateProject
        end
      end
    end
  end
end
