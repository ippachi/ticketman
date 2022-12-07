# frozen_string_literal: true

module Ticketman
  module Gateway
    module Queries
      class ProjectQuery < Query
        def initialize(relation: Relations::Projects.new)
          super()
          @relation = relation
        end
      end
    end
  end
end
