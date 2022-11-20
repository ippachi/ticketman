# frozen_string_literal: true
# typed: strict

require "dotenv"
Dotenv.load(".env.#{ENV.fetch('APP_ENV', 'development')}")

require "zeitwerk"
require "sorbet-runtime"
require "graphql"
require "mongo"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API")
loader.inflector.inflect("workspace_id" => "WorkspaceID")
loader.inflector.inflect("graphql" => "GraphQL")
loader.setup

module Ticketman
end

loader.eager_load
