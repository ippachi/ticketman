# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class OrganizationQuery < Query
      include Web::OrganizationQuery

      sig { params(organizations: Organizations).void }
      def initialize(organizations)
        super
        @relation = organizations
      end
    end
  end
end
