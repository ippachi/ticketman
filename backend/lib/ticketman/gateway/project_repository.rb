# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class ProjectRepository < Repository
      extend T::Sig
      include Domain::Model::Organization::ProjectRepository

      sig { params(projects: Projects).void }
      def initialize(projects)
        super
        @relation = projects
      end

      private

      sig do
        override.params(attributes: T::Hash[Symbol, T.untyped]).returns(Ticketman::Domain::Model::Organization::Project)
      end
      def build(attributes) = Domain::Model::Organization::ProjectFactory.create(**T.unsafe(attributes))
    end
  end
end
