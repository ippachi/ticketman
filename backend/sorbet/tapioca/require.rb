# typed: true
# frozen_string_literal: true

require "dry/container"
require "dry/container/stub"
require "graphql"
require "json"
require "mongo"
require "rack/contrib"
require "rack/cors"
require "rack/test"
require "simplecov"
require "sinatra/base"
require "sinatra/json"
require "sorbet-runtime"
require "test/unit"
require "test/unit/rr"
require "warning"
require "zeitwerk"
