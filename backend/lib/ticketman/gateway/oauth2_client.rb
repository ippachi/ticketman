# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class OAuth2Client
      extend T::Sig
      include Application::OAuth2Client

      sig { params(oauth2: OAuth2::Client).void }
      def initialize(oauth2)
        @oauth2 = oauth2
      end

      sig { override.params(state: String, nonce: String, code_verifier: String).returns(String) }
      def authorize_url(state:, nonce:, code_verifier:)
        code_challenge = Base64.urlsafe_encode64(OpenSSL::Digest::SHA256.digest(code_verifier), padding: false)
        @oauth2.auth_code.authorize_url(
          redirect_uri: "#{ENV["CLIENT_URL"]}/auth/callback", scope: "openid profile",
          state:, nonce:, code_challenge:, code_challenge_method: "S256"
        )
      end

      sig { override.params(code: String, code_verifier: String).returns(T.untyped) }
      def get_token(code, code_verifier)
        # :nocov:
        @oauth2.auth_code.get_token(code, redirect_uri: "#{ENV["CLIENT_URL"]}/auth/callback", code_verifier:)
        # :nocov:
      end
    end
  end
end
