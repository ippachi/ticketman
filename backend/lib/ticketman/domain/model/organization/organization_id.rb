# frozen_string_literal: true
# typed: strict

module Ticketman
  module Domain
    module Model
      module Organization
        class OrganizationID < Identifier
          sig { params(value: String).void }
          def initialize(value)
            super(value)
            verify
          end

          sig { void }
          def verify
            raise if @value.empty?
          end
        end
      end
    end
  end
end
