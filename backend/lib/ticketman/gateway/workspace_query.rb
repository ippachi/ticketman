# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceQuery
      extend T::Sig
      include Web::WorkspaceQuery

      sig { params(workspaces: Workspaces).void }
      def initialize(workspaces)
        @workspaces = workspaces
      end

      sig { override.params(id: String).returns(T.untyped) }
      def find(id)
        @workspaces.find(id)
      end
    end
  end
end
