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
    post_create_workspace_mutation
    assert_response({ data: { createWorkspace: { workspace: { id: "hoge", name: "test workspace" } } } })

    post "/graphql", {
      query: <<~QUERY
        { workspace(id: "hoge") { id, name } }
      QUERY
    }
    assert_response({ data: { workspace: { id: "hoge", name: "test workspace" } } })
  end

  def test_internal_server_error
    post_create_workspace_mutation
    post_create_workspace_mutation
    assert_equal "Internal Server Error", parsed_body[:errors].first[:message]
  end

  private

  def assert_response(body, message = nil)
    diff = AssertionMessage.delayed_diff(body, parsed_body)
    format = <<~EOT
      <?> expected but was
      <?>.?
    EOT
    full_message = build_message(message, format, body, parsed_body, diff)
    assert_block(full_message) do
      body == parsed_body
    end
  end

  def parsed_body = JSON.parse(last_response.body, symbolize_names: true)

  def post_create_workspace_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          createWorkspace(id: "hoge", name: "test workspace") {
            workspace{ id, name }
          }
        }
      MUTATION
    }
  end
end
