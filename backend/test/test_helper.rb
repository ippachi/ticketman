# frozen_string_literal: true

require "simplecov"
SimpleCov.start
require "warning"

Gem.path.each do |path|
  Warning.ignore(//, path)
end

Warning.ignore(%r{warning: loading in progress, circular require considered harmful - .*/cgi/util.rb})

ENV["APP_ENV"] = "test"

require "test/unit"
require "test/unit/rr"
require "ticketman"

require_relative "./support/test_case"
require_relative "./support/request_test_case"
require_relative "./support/application_test_case"
