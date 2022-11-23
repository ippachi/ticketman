# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class WorkspaceQuery < Query
      include Web::WorkspaceQuery

      sig { params(workspaces: Workspaces).void }
      def initialize(workspaces)
        super
        @relation = workspaces
      end
    end
  end
end
