# frozen_string_literal: true

require "jwt"

module Ticketman
  module Web
    module GraphQL
      module Mutations
        class GenerateAuthUrl < ::GraphQL::Schema::Mutation
          field :url, String, null: true

          def initialize(*args, application_service: Application::AuthApplicationService.new, **kwargs, &block)
            super(*args, **kwargs, &block)
            @application_service = application_service
          end

          def resolve
            { url: @application_service.generate_auth_url(context[:session]) }
          end
        end
      end
    end
  end
end
