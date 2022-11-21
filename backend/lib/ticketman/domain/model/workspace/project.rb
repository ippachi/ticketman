# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class Project
          extend T::Sig

          sig { returns(ProjectID) }
          attr_reader :id

          sig { params(id: ProjectID, name: String).void }
          def initialize(id:, name:)
            @id = id
            @name = name
          end

          sig { returns(T::Hash[Symbol, T.untyped]) }
          def serialize = { id: @id.serialize, name: @name }
        end
      end
    end
  end
end
