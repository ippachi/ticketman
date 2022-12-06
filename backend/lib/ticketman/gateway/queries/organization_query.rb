# frozen_string_literal: true

module Ticketman
  module Gateway
    module Queries
      class OrganizationQuery < Query
        def initialize(organizations)
          super
          @relation = organizations
        end
      end
    end
  end
end
