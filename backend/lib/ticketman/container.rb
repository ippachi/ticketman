# frozen_string_literal: true
# typed: strict

require "dry/container"

module Ticketman
  class Container
    extend Dry::Container::Mixin

    namespace("gateway") do
      register("mongo_client", memoize: true) do
        Mongo::Client.new(
          [ENV.fetch("DATABASE_HOST", nil)], user: ENV.fetch("DATABASE_USER", nil),
                                             password: ENV.fetch("DATABASE_PASSWORD", nil),
                                             database: ENV.fetch("DATABASE_NAME", nil)
        )
      end

      register("workspace_query") do
        Gateway::WorkspaceQuery.new(resolve("workspaces"))
      end

      register("workspace_repo") do
        Gateway::WorkspaceRepository.new(resolve("workspaces"))
      end

      register("workspaces") do
        Gateway::Workspaces.new(resolve("mongo_client"))
      end
    end

    namespace("application") do
      register("workspace.workspace_application_service") do
        Application::Workspace::WorkspaceApplicationService.new(
          workspace_repo: Container.resolve("gateway.workspace_repo")
        )
      end
    end
  end
end
