# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class ProjectRepository < Repository
        def initialize(projects)
          super
          @relation = projects
        end

        private

        def build(attributes) = Domain::Model::Organization::ProjectFactory.create(**attributes)
      end
    end
  end
end
