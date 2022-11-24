# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class OrganizationRepository < Repository
      extend T::Sig
      include Domain::Model::Organization::OrganizationRepository

      sig { params(organizations: Organizations).void }
      def initialize(organizations)
        super
        @organizations = organizations
      end

      sig do
        override.params(attributes: T::Hash[Symbol,
                                            T.untyped]).returns(Ticketman::Domain::Model::Organization::Organization)
      end
      def build(attributes) = Domain::Model::Organization::OrganizationFactory.create(**T.unsafe(attributes))
    end
  end
end
