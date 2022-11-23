# frozen_string_literal: true
# typed: true

require "test_helper"
require "rack/test"
require "json"

class RequestTest < TestCase
  include Rack::Test::Methods

  def app
    Ticketman::Web::API
  end

  def test_post_and_get_workspace_request
    post_create_workspace_mutation
    assert_equal parsed_body, { data: { createWorkspace: { workspace: { id: "hoge", name: "test workspace" } } } }

    post "/graphql", {
      query: <<~QUERY
        { workspace(id: "hoge") { id, name } }
      QUERY
    }
    assert_equal parsed_body, { data: { workspace: { id: "hoge", name: "test workspace" } } }
  end

  def test_post_and_get_project_request
    post_create_workspace_mutation
    post_create_project_mutation

    assert_equal parsed_body[:data][:createProject][:project][:name], "test project"

    post "/graphql", {
      query: <<~QUERY
        { project(id: "#{parsed_body[:data][:createProject][:project][:id]}") { id, name } }
      QUERY
    }

    assert_equal parsed_body[:data][:project][:name], "test project"
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

  private

  def parsed_body = JSON.parse(last_response.body, symbolize_names: true)

  def post_create_workspace_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          createWorkspace(id: "hoge", name: "test workspace") {
            workspace{ id, name }
          }
        }
      MUTATION
    }
  end

  def post_create_project_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          createProject(workspaceId: "hoge", name: "test project") {
            project{ id, name }
          }
        }
      MUTATION
    }
  end
end
