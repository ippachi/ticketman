# frozen_string_literal: true
# typed: true

require "test_helper"
require "json"

class RequestTest < RequestTestCase
  def test_post_and_get_organization_request
    organization = post_create_organization_mutation
    assert_equal parsed_body[:data][:createOrganization][:organization], organization
    organization = post_organization_query
    assert_equal parsed_body[:data][:organization], organization
  end

  def test_post_and_get_project_request
    post_create_organization_mutation
    project = post_create_project_mutation
    assert_equal parsed_body[:data][:createProject][:project][:name], project[:name]
    project = post_project_query
    assert_equal parsed_body[:data][:project][:name], project[:name]
  end

  def test_application_error
    post_create_organization_mutation
    post_create_organization_mutation
    assert_equal "Duplicate ID.", parsed_body[:errors].first[:message]
  end

  def test_standard_error
    organization_application_service_stub = Object.new
    stub(organization_application_service_stub).create_organization { raise StandardError }
    Ticketman::Container.stub("application.organization.organization_application_service",
                              organization_application_service_stub)
    post_create_organization_mutation
  end

  def test_not_found_error
    post_organization_query
    assert_equal "NOT_FOUND", parsed_body[:errors].first[:extensions][:code]
  end

  def test_post_empty
    post "/graphql"
    assert { !parsed_body[:data].nil? }
  end
end
