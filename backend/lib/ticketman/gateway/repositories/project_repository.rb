# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class ProjectRepository < Repository
        def initialize(relation: Relations::Projects.new)
          super()
          @relation = relation
        end

        private

        def build(attributes) = Domain::Model::Organization::Project.new(**attributes)
      end
    end
  end
end
