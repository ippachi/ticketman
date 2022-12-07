# frozen_string_literal: true

module Ticketman
  module Application
    module Organization
      class OrganizationApplicationService
        class CreateOrganizationDuplicateIDError < Error; end

        def initialize(organization_repo: Gateway::Repositories::OrganizationRepository.new,
                       project_repo: Gateway::Repositories::ProjectRepository.new)
          @organization_repo = organization_repo
          @project_repo = project_repo
        end

        def create_organization(id, name)
          organization = Domain::Model::Organization::OrganizationFactory.create(id:, name:)
          begin
            @organization_repo.save(organization)
          rescue Errors::DuplicateKeyError
            raise CreateOrganizationDuplicateIDError, "Duplicate ID."
          end
          organization
        end

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
