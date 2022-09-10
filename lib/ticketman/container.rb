# typed: strict

require "dry/container"

module Ticketman
  class Container
    extend Dry::Container::Mixin

    register("gateway.mongo_client") do
      Mongo::Client.new(["127.0.0.1:27017"], user: "ticketman", password: "password", database: "ticketmanTestDB")
    end

    register("gateway.workspace_query") do
      Gateway::WorkspaceQuery.new(resolve("gateway.mongo_client"))
    end

    register("gateway.workspace_repo") do
      Gateway::WorkspaceRepository.new(resolve("gateway.mongo_client"))
    end
  end
end
