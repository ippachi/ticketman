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

          def initialize(*args, application_service: Application::AuthApplicationService.new, **kwargs, &block)
            super(*args, **kwargs, &block)
            @application_service = application_service
          end

          def resolve(code:, state:)
            # :nocov:
            @application_service.signin(code:, state:, session: context[:session])
            { user: nil }
            # :nocov:
          end
        end
      end
    end
  end
end
