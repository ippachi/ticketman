# frozen_string_literal: true

require "rack/test"

class RequestTestCase < TestCase
  include Rack::Test::Methods

  def app
    Ticketman::Web::API
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

    parsed_body.dig(:data, :createWorkspace, :workspace)
  end

  def post_workspace_query
    post "/graphql", {
      query: <<~QUERY
        { workspace(id: "hoge") { id, name } }
      QUERY
    }

    parsed_body.dig(:data, :workspace)
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

    parsed_body.dig(:data, :createProject, :project)
  end

  def post_project_query
    post "/graphql", {
      query: <<~QUERY
        { project(id: "#{parsed_body[:data][:createProject][:project][:id]}") { id, name } }
      QUERY
    }

    parsed_body.dig(:data, :project)
  end
end
