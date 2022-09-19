# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class WorkspaceID
          extend T::Sig

          sig { params(value: String).void }
          def initialize(value)
            @value = value
          end

          sig { returns(String) }
          def serialize = @value
        end
      end
    end
  end
end