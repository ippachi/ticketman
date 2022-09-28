# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class WorkspaceFactory
          extend T::Sig

          sig { params(id: String, name: String).returns(Workspace) }
          def self.create(id:, name:)
            Workspace.new(id: Ticketman::Domain::Model::Workspace::WorkspaceID.new(id), name:)
          end
        end
      end
    end
  end
end
