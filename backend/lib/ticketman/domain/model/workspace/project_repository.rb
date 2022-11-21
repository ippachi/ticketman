# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        module ProjectRepository
          extend T::Sig
          extend T::Helpers

          interface!

          sig { abstract.params(project: Project).void }
          def save(project); end

          sig { abstract.params(project_id: T.any(String, ProjectID)).returns(Project) }
          def find(project_id); end
        end
      end
    end
  end
end
