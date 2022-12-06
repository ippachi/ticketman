# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      class Schema < ::GraphQL::Schema
        query Types::Query
        mutation Types::Mutation

        rescue_from(Application::Error) do |err|
          raise ::GraphQL::ExecutionError, err
        end

        rescue_from(StandardError) do |err, obj, args|
          p err
          raise ::GraphQL::ExecutionError, "Internal Server Error"
        end

        rescue_from(Query::Errors::NotFoundError) do
          raise ::GraphQL::ExecutionError.new("Not Found", extensions: { code: "NOT_FOUND" })
        end
      end
    end
  end
end
