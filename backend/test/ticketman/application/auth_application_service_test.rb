# typed: true
# frozen_string_literal: true

module Ticketman
  module Application
    class AuthApplicationServiceTest < TestCase
      def setup
        super
        @oauth2_client = Object.new
        stub(@oauth2_client).get_token { "id_token" }
        stub(@oauth2_client).authorize_url { "https://example.com" }
        @auth_application_service = AuthApplicationService.new(oauth2_client: @oauth2_client)
      end

      def test_generate_auth_url
        session = {}
        url = @auth_application_service.generate_auth_url(session)
        assert_equal String, url.class
        assert session[:state]
        assert session[:nonce]
      end

      def test_signin_with_no_logto_user
        session = { state: "test" }
        stub(@auth_application_service).verify { { "sub" => "sub", "username" => "username" } }
        @auth_application_service.signin(code: "test", state: "test", session:)
        assert @logto_user_repo.find("sub")
        assert @user_repo.find(session[:user_id])
      end

      def test_signin_with_logto_user
        session = { state: "test" }
        stub(@auth_application_service).verify { { "sub" => "sub", "username" => "username" } }
        @auth_application_service.signin(code: "test", state: "test", session:)
        @auth_application_service.signin(code: "test", state: "test", session:)
      end
    end
  end
end
