# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module Organization
      class OrganizationApplicationService
        class CreateOrganizationDuplicateIDError < Error; end

        extend T::Sig

        sig do
          params(
            organization_repo: Domain::Model::Organization::OrganizationRepository,
            project_repo: Domain::Model::Organization::ProjectRepository
          ).void
        end
        def initialize(organization_repo:, project_repo:)
          @organization_repo = organization_repo
          @project_repo = project_repo
        end

        sig { params(id: String, name: String).returns(Domain::Model::Organization::Organization) }
        def create_organization(id, name)
          organization = Domain::Model::Organization::OrganizationFactory.create(id:, name:)
          begin
            @organization_repo.save(organization)
          rescue Errors::DuplicateKeyError
            raise CreateOrganizationDuplicateIDError, "Duplicate ID."
          end
          organization
        end

        sig { params(organization_id: String, name: String).returns(Domain::Model::Organization::Project) }
        def create_project(organization_id:, name:)
          organization = @organization_repo.find(organization_id)
          project = organization.create_project(name:)
          @project_repo.save(project)
          project
        end
      end
    end
  end
end
