# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class ProjectRepository
      class NotFoundError < StandardError; end

      extend T::Sig
      include Domain::Model::Workspace::ProjectRepository

      sig { params(projects: Projects).void }
      def initialize(projects)
        @projects = projects
      end

      sig { override.params(project: Domain::Model::Workspace::Project).void }
      def save(project)
        @projects.insert_one(project.serialize)
      end

      sig { override.params(project_id: T.any(String, Domain::Model::Workspace::ProjectID)).returns(Domain::Model::Workspace::Project) }
      def find(project_id)
        result = @projects.find(project_id.to_s)
        raise NotFoundError unless result

        Domain::Model::Workspace::ProjectFactory.create(**T.unsafe(result))
      end
    end
  end
end
