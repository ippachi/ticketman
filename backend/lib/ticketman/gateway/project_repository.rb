# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class ProjectRepository < Repository
      extend T::Sig
      include Domain::Model::Workspace::ProjectRepository

      sig { params(projects: Projects).void }
      def initialize(projects)
        super
        @relation = projects
      end

      private

      sig { override.params(attributes: T::Hash[Symbol, T.untyped]).returns(Ticketman::Domain::Model::Workspace::Project) }
      def build(attributes) = Domain::Model::Workspace::ProjectFactory.create(**T.unsafe(attributes))
    end
  end
end
