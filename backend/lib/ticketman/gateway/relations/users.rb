# frozen_string_literal: true

module Ticketman
  module Gateway
    module Relations
      class Users < Relation
        private

        def name = :users
      end
    end
  end
end
