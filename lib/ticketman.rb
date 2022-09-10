# typed: strict

require "zeitwerk"
require "sorbet-runtime"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API")
loader.setup

module Ticketman
end

loader.eager_load
