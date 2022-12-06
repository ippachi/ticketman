# frozen_string_literal: true

module Ticketman
  module Gateway
    module Relations
      class Organizations < Relation
        private

        def name = :organizations
      end
    end
  end
end
