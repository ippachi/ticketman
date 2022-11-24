# typed: true
# frozen_string_literal: true

module Ticketman
  module Application
    module Organization
      class OrganizationApplicationServiceTest < TestCase
        def teardown
          Ticketman::Container["gateway.mongo_client"].collections.each(&:delete_many)
        end

        def test_create_organization
          create_organization
          assert Container["gateway.organization_repo"].find("hoge")
        end

        def test_create_organization_with_duplicate_id
          create_organization
          assert_raises Organization::OrganizationApplicationService::CreateOrganizationDuplicateIDError do
            create_organization
          end
        end

        def test_create_project
          organization = create_organization
          project = Container["application.organization.organization_application_service"].create_project(
            organization_id: organization.id.to_s,
            name: "hoge project"
          )
          assert Container["gateway.project_repo"].find(project.id)
        end

        private

        def create_organization
          Container["application.organization.organization_application_service"].create_organization("hoge", "name")
        end
      end
    end
  end
end
