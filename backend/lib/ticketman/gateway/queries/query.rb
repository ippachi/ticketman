# frozen_string_literal: true

module Ticketman
  module Gateway
    module Queries
      class Query
        class NotFoundError < Web::Query::Errors::NotFoundError; end

        def find(id)
          result = @relation.find(id)
          raise NotFoundError unless result

          result
        end
      end
    end
  end
end
