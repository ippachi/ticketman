# frozen_string_literal: true

class ApplicationTestCase < TestCase
  def setup
    super
    stub.proxy(Ticketman::Gateway::OAuth2Client).new { |obj| stub(obj).get_token { "token " } }
    stub.proxy(Ticketman::Application::AuthApplicationService).new do |obj|
      stub(obj).verify { { "sub" => "sub", "username" => "test" } }
    end
    @current_user = Ticketman::Application::AuthApplicationService.new.signin(code: "code", state: "state", session: {})
  end
end
