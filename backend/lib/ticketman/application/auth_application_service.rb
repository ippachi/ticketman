# frozen_string_literal: true

module Ticketman
  module Application
    class AuthApplicationService
      def initialize(oauth2_client: Gateway::OAuth2Client.new)
        @oauth2_client = oauth2_client
      end

      # :nocov:
      def generate_auth_url(session)
        session[:code_verifier] = SecureRandom.alphanumeric(128)
        session[:nonce] = SecureRandom.uuid
        session[:state] = SecureRandom.uuid
        @oauth2_client.authorize_url(state: session[:state], nonce: session[:nonce],
                                     code_verifier: session[:code_verifier])
      end

      def signin(code:, state:, session:)
        access = @oauth2_client.get_token(code, session[:code_verifier])
        verify(access.params.id_token, state, session)
      end

      private

      def verify(token, state, session)
        raise StandardError, "state is not valid" if state != session[:state]

        jwks = JSON.parse(Net::HTTP.get(URI("#{ENV.fetch('LOGTO_ENDPOINT', nil)}/jwks")))
        result = JWT.decode(token, nil,
                            true,
                            iss: ENV.fetch("LOGTO_ENDPOINT", nil),
                            verify_iss: true,
                            aud: ENV.fetch("LOGTO_APP_ID", nil),
                            verify_aud: true,
                            algorithms: ["RS256"],
                            jwks:)
        raise StandardError, "nonce is not valid" if result.first["nonce"] != session[:nonce]

        session[:state] = nil
        session[:nonce] = nil

        result.first
      end
      # :nocov:
    end
  end
end
