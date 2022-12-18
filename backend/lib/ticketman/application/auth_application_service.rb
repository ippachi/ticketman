# frozen_string_literal: true

module Ticketman
  module Application
    class AuthApplicationService < ApplicationService
      def initialize(oauth2_client: Gateway::OAuth2Client.new,
                     logto_user_repo: Gateway::Repositories::LogtoUserRepository.new,
                     user_repo: Gateway::Repositories::UserRepository.new)
        super()
        @oauth2_client = oauth2_client
        @logto_user_repo = logto_user_repo
        @user_repo = user_repo
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
        id_token = @oauth2_client.get_token(code, session[:code_verifier])
        result = verify(id_token, state, session)

        logto_user = @logto_user_repo.find_or_nil(result["sub"])

        user = if logto_user
                 @user_repo.find_or_nil(logto_user.user_id)
               else
                 create_user(result)
               end

        session[:user_id] = user.id
        user
      end

      def current_user(user_id) = @user_repo.find_or_nil(user_id)

      private

      def verify(token, state, session)
        raise StandardError, "state is not valid" if state != session[:state]

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

      def jwks = JSON.parse(Net::HTTP.get(URI("#{ENV.fetch('LOGTO_ENDPOINT', nil)}/jwks")))
      # :nocov:

      def create_user(attributes)
        user = Domain::Model::User.new(name: attributes["username"])
        logto_user = Domain::Model::LogtoUser.new(id: attributes["sub"], user_id: user.id)
        Thread::Mutex.new.synchronize do
          transaction do
            @user_repo.save(user)
            @logto_user_repo.save(logto_user)
          end
        end
        user
      end
    end
  end
end
