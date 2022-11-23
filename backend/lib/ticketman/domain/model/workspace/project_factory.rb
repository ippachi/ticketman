# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class ProjectFactory
          extend T::Sig

          sig { params(name: String, id: T.nilable(String)).returns(Project) }
          def self.create(name:, id: nil)
            Project.new(id: Ticketman::Domain::Model::Workspace::ProjectID.new(id || ULID.generate), name:)
          end
        end
      end
    end
  end
end
