# typed: true
# frozen_string_literal: true

module Ticketman
  module Application
    class AuthApplicationServiceTest < TestCase
      def test_generate_auth_url
        session = {}
        url = AuthApplicationService.new.generate_auth_url(session)
        assert_equal String, url.class
        assert session[:state]
        assert session[:nonce]
      end
    end
  end
end
