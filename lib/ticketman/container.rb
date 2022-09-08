# typed: strict

require "dry/container"

require_relative "./gateway"

module Ticketman
  container = Dry::Container.new
  container.register("gateway.workspace_query", Gateway::WorkspaceQuery.new)
  Container = T.let(container, T.untyped)
end
