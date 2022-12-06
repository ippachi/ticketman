# frozen_string_literal: true

module Ticketman
  module Gateway
    module Queries
      class ProjectQuery < Query
        def initialize(projects)
          super
          @projects = projects
        end
      end
    end
  end
end
