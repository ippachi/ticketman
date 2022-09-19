# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module Errors
      module DuplicateKeyError
        extend T::Helpers

        interface!
      end
    end
  end
end
