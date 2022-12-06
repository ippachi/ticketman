# frozen_string_literal: true

require "jwt"

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class Signin < ::GraphQL::Schema::Mutation
          argument :code, String
          argument :state, String

          field :user, Types::Project, null: true

          def resolve(code:, state:)
            # :nocov:
            hoge = Container["application.auth_application_service"].signin(code:, state:, session: context[:session])
            { user: nil }
            # :nocov:
          end
        end
      end
    end
  end
end
