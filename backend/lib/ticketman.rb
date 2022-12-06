# frozen_string_literal: true
# typed: strict

require_relative "./ticketman/bootstrap/environment"
require "zeitwerk"
require "graphql"
require "mongo"
require "ulid"
require "oauth2"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API")
loader.inflector.inflect("graphql" => "GraphQL")
loader.inflector.inflect("oauth2_client" => "OAuth2Client")
loader.ignore("#{__dir__}/ticketman/bootstrap")
loader.setup

module Ticketman
end

loader.eager_load
