# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class ProjectFactory
          extend T::Sig

          sig { params(id: String, name: String).returns(Project) }
          def self.create(id:, name:)
            Project.new(id: Ticketman::Domain::Model::Workspace::ProjectID.new(id), name:)
          end
        end
      end
    end
  end
end
