# frozen_string_literal: true

module Ticketman
  module Gateway
    module Queries
      class OrganizationQuery < Query
        def initialize(relation = Relations::Organizations.new)
          super()
          @relation = relation
        end
      end
    end
  end
end
