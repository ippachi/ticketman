# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class Workspace
          extend T::Sig

          sig { params(id: WorkspaceID, name: String).void }
          def initialize(id:, name:)
            @id = id
            @name = name
          end

          sig { params(name: String).returns(Project) }
          def create_project(name:)
            Project.new(name:)
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { id: @id.serialize, name: @name }
        end
      end
    end
  end
end
