# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Workspace
        class Project
          extend T::Sig

          sig { params(name: String).void }
          def initialize(name:)
            @name = name
          end
        end
      end
    end
  end
end
