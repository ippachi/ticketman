# frozen_string_literal: true
# typed: strict

module Ticketman
  module Web
    module GraphQL
      class Schema < ::GraphQL::Schema
        query Types::Query
        mutation Types::Mutation

        rescue_from(StandardError) do
          raise ::GraphQL::ExecutionError, "Internal Server Error"
        end
      end
    end
  end
end
