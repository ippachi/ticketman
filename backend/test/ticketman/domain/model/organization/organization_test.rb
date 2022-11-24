# frozen_string_literal: true
# typed: true

module Ticketman
  module Domain
    module Model
      module Organization
        class OrganizationTest < TestCase
          def test_create_organization
            assert_equal Organization, create_organization.class
          end

          def test_create_project
            assert_equal Project, create_organization.create_project(name: "test project").class
          end

          private

          def create_organization
            OrganizationFactory.create(id: "hoge", name: "test")
          end
        end
      end
    end
  end
end
