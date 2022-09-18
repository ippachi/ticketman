# frozen_string_literal: true
# typed: strict

module Ticketman
  module Web
    module GraphQL
      class Schema < ::GraphQL::Schema
        query Types::Query
        mutation Types::Mutation
      end
    end
  end
end
