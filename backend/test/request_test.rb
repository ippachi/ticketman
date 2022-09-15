# frozen_string_literal: true
# typed: true

require "test_helper"
require "rack/test"
require "json"

class RequestTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def teardown
    Ticketman::Container["gateway.mongo_client"].collections.each(&:delete_many)
  end

  def app
    Ticketman::Web::API
  end

  def test_post_and_get_workspace_request
    post "/workspaces", { id: "hoge", name: "test workspace" }
    assert_response(201, { id: "hoge", name: "test workspace" })

    get "/workspaces/hoge"
    assert_response(200, { id: "hoge", name: "test workspace" })
  end

  private

  def assert_response(status, body, message = nil)
    expected = [status, body]
    diff = AssertionMessage.delayed_diff(expected, assert_response_actual)
    format = <<~EOT
      <?> expected but was
      <?>.?
    EOT
    full_message = build_message(message, format, expected, assert_response_actual, diff)
    assert_block(full_message) do
      expected == assert_response_actual
    end
  end

  def assert_response_actual
    parsed_body = JSON.parse(last_response.body, symbolize_names: true)
    [last_response.status, parsed_body]
  end
end
