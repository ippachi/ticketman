# frozen_string_literal: true

module Ticketman
  module Gateway
    class OAuth2Client

      def initialize(oauth2)
        @oauth2 = oauth2
      end

      def authorize_url(state:, nonce:, code_verifier:)
        code_challenge = Base64.urlsafe_encode64(OpenSSL::Digest::SHA256.digest(code_verifier), padding: false)
        @oauth2.auth_code.authorize_url(
          redirect_uri: "#{ENV["CLIENT_URL"]}/auth/callback", scope: "openid profile",
          state:, nonce:, code_challenge:, code_challenge_method: "S256"
        )
      end

      def get_token(code, code_verifier)
        # :nocov:
        @oauth2.auth_code.get_token(code, redirect_uri: "#{ENV["CLIENT_URL"]}/auth/callback", code_verifier:)
        # :nocov:
      end
    end
  end
end
