# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class Workspace < Entity
          sig { params(id: WorkspaceID, name: String).void }
          def initialize(id:, name:)
            super(id)
            @name = name
          end

          sig { params(name: String).returns(Project) }
          def create_project(name:)
            Project.new(id: ProjectID.new("hoge"), name:)
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { **super, name: @name }
        end
      end
    end
  end
end
