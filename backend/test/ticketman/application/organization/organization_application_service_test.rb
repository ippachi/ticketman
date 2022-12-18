# typed: true
# frozen_string_literal: true

require "test_helper"

module Ticketman
  module Application
    module Organization
      class OrganizationApplicationServiceTest < ApplicationTestCase
        def setup
          super
          @application_service = OrganizationApplicationService.new
        end

        def test_create_organization
          create_organization
          assert @organization_repo.find("hoge")
        end

        def test_create_organization_with_duplicate_id
          create_organization
          assert_raises Organization::OrganizationApplicationService::CreateOrganizationDuplicateIDError do
            create_organization
          end
        end

        def test_create_project
          organization = create_organization
          project = @application_service.create_project(
            @current_user,
            organization_id: organization.id.to_s,
            name: "hoge project"
          )
          assert @project_repo.find(project.id)
        end

        private

        def create_organization
          @application_service.create_organization(@current_user, id: "hoge", name: "name")
        end
      end
    end
  end
end
