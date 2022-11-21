# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class Workspace
          extend T::Sig

          sig { returns(WorkspaceID) }
          attr_reader :id

          sig { params(id: WorkspaceID, name: String).void }
          def initialize(id:, name:)
            @id = id
            @name = name
          end

          sig { params(name: String).returns(Project) }
          def create_project(name:)
            Project.new(id: ProjectID.new("hoge"), name:)
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { id: @id.serialize, name: @name }
        end
      end
    end
  end
end
