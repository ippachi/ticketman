# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        module WorkspaceRepository
          extend T::Sig
          extend T::Helpers

          interface!

          sig { abstract.params(workspace: Workspace).void }
          def save(workspace); end
        end
      end
    end
  end
end
