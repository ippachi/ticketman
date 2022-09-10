# typed: true

require "test_helper"
require "rack/test"
require "json"

class RequestTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Ticketman::Web::API
  end

  def test_get_workspace_request
    Ticketman::Container["gateway.workspace_repo"].save(id: "1", name: "name")

    get "/workspaces/1"
    assert_equal 200, last_response.status
    assert_equal({ id: "1", name: "name" }, JSON.parse(last_response.body, symbolize_names: true))
  end
end
