# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceRepository < Repository
      extend T::Sig
      include Domain::Model::Workspace::WorkspaceRepository

      sig { params(workspaces: Workspaces).void }
      def initialize(workspaces)
        super
        @workspaces = workspaces
      end

      sig { override.params(attributes: T::Hash[Symbol, T.untyped]).returns(Ticketman::Domain::Model::Workspace::Workspace) }
      def build(attributes) = Domain::Model::Workspace::WorkspaceFactory.create(**T.unsafe(attributes))
    end
  end
end
