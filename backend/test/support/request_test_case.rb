# frozen_string_literal: true

require "rack/test"

class RequestTestCase < TestCase
  include Rack::Test::Methods

  def app
    Ticketman::Web::API
  end

  private

  def parsed_body = JSON.parse(last_response.body, symbolize_names: true)

  def post_create_organization_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          createOrganization(id: "hoge", name: "test organization") {
            organization{ id, name }
          }
        }
      MUTATION
    }

    parsed_body.dig(:data, :createOrganization, :organization)
  end

  def post_organization_query
    post "/graphql", {
      query: <<~QUERY
        { organization(id: "hoge") { id, name } }
      QUERY
    }

    parsed_body.dig(:data, :organization)
  end

  def post_create_project_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          createProject(organizationId: "hoge", name: "test project") {
            project{ id, name }
          }
        }
      MUTATION
    }

    parsed_body.dig(:data, :createProject, :project)
  end

  def post_generate_auth_url_mutation
    post "/graphql", {
      query: <<~MUTATION
        mutation {
          generateAuthUrl {
            url
          }
        }
      MUTATION
    }

    parsed_body.dig(:data, :generateAuthUrl, :url)
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
