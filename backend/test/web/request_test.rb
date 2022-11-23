# frozen_string_literal: true
# typed: true

require "test_helper"
require "json"

class RequestTest < RequestTestCase
  def test_post_and_get_workspace_request
    workspace = post_create_workspace_mutation
    assert_equal parsed_body[:data][:createWorkspace][:workspace], workspace
    workspace = post_workspace_query
    assert_equal parsed_body[:data][:workspace], workspace
  end

  def test_post_and_get_project_request
    post_create_workspace_mutation
    project = post_create_project_mutation
    assert_equal parsed_body[:data][:createProject][:project][:name], project[:name]
    project = post_project_query
    assert_equal parsed_body[:data][:project][:name], project[:name]
  end

  def test_application_error
    post_create_workspace_mutation
    post_create_workspace_mutation
    assert_equal "Duplicate ID.", parsed_body[:errors].first[:message]
  end

  def test_standard_error
    workspace_application_service_stub = Object.new
    stub(workspace_application_service_stub).create_workspace { raise StandardError }
    Ticketman::Container.stub("application.workspace.workspace_application_service", workspace_application_service_stub)
    post_create_workspace_mutation
  end

  def test_post_empty
    post "/graphql"
    assert { !parsed_body[:data].nil? }
  end
end
