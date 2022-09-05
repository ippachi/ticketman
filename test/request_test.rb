# typed: true

require "test_helper"
require "rack/test"

class RequestTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Ticketman::Web::API
  end

  def test_root_request
    get '/'
    assert last_response.ok?
  end
end
