# frozen_string_literal: true
# typed: true

require "jwt"

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class GenerateAuthUrl < ::GraphQL::Schema::Mutation
          field :url, String, null: true

          def resolve
            { url: Container["application.auth_application_service"].generate_auth_url(context[:session]) }
          end
        end
      end
    end
  end
end
