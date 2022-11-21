# frozen_string_literal: true
# typed: strict

require_relative "./ticketman/bootstrap/environment"
require "zeitwerk"
require "sorbet-runtime"
require "graphql"
require "mongo"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API")
loader.inflector.inflect("workspace_id" => "WorkspaceID")
loader.inflector.inflect("project_id" => "ProjectID")
loader.inflector.inflect("graphql" => "GraphQL")
loader.ignore("#{__dir__}/ticketman/bootstrap")
loader.setup

module Ticketman
end

loader.eager_load
