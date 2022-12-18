# frozen_string_literal: true

module Ticketman
  module Gateway
    class OAuth2Client
      def initialize
        @oauth2 = OAuth2::Client.new(ENV.fetch("LOGTO_APP_ID", nil), ENV.fetch("LOGTO_APP_SECRET", nil),
                                     site: ENV.fetch("LOGTO_ENDPOINT", nil),
                                     authorize_url: "/oidc/auth",
                                     token_url: "/oidc/token")
      end

      def authorize_url(state:, nonce:, code_verifier:)
        code_challenge = Base64.urlsafe_encode64(OpenSSL::Digest::SHA256.digest(code_verifier), padding: false)
        @oauth2.auth_code.authorize_url(
          redirect_uri: "#{ENV.fetch('CLIENT_URL', nil)}/auth/callback", scope: "openid profile",
          state:, nonce:, code_challenge:, code_challenge_method: "S256"
        )
      end

      def get_token(code, code_verifier)
        # :nocov:
        @oauth2.auth_code.get_token(code, redirect_uri: "#{ENV.fetch('CLIENT_URL', nil)}/auth/callback",
                                          code_verifier:).params.id_token
        # :nocov:
      end
    end
  end
end
