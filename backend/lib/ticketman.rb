# frozen_string_literal: true
# typed: strict

require "zeitwerk"
require "sorbet-runtime"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API")
loader.inflector.inflect("workspace_id" => "WorkspaceID")
loader.setup

module Ticketman
end

loader.eager_load
