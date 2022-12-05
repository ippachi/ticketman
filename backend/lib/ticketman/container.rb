# frozen_string_literal: true
# typed: strict

require "dry/container"

module Ticketman
  class Container
    extend Dry::Container::Mixin
    namespace("gateway") do
      register("mongo_client", memoize: true) do
        Mongo::Client.new(
          [ENV.fetch("DATABASE_HOST", nil)], user: ENV.fetch("DATABASE_USER", nil),
                                             password: ENV.fetch("DATABASE_PASSWORD", nil),
                                             database: ENV.fetch("DATABASE_NAME", nil)
        )
      end

      register("organization_query") do
        Gateway::OrganizationQuery.new(resolve("organizations"))
      end

      register("organization_repo") do
        Gateway::OrganizationRepository.new(resolve("organizations"))
      end

      register("organizations") do
        Gateway::Organizations.new(resolve("mongo_client"))
      end

      register("project_query") do
        Gateway::ProjectQuery.new(resolve("projects"))
      end

      register("project_repo") do
        Gateway::ProjectRepository.new(resolve("projects"))
      end

      register("projects") do
        Gateway::Projects.new(resolve("mongo_client"))
      end

      register("oauth2_client_strategy") do
        OAuth2::Client.new(ENV.fetch("LOGTO_APP_ID", nil), ENV.fetch("LOGTO_APP_SECRET", nil),
                           site: ENV.fetch("LOGTO_ENDPOINT", nil),
                           authorize_url: "/oidc/auth",
                           token_url: "/oidc/token")
      end

      register("oauth2_client") do
        Gateway::OAuth2Client.new(resolve("oauth2_client_strategy"))
      end
    end

    namespace("application") do
      register("auth_application_service") do
        Application::AuthApplicationService.new(oauth2_client: Container["gateway.oauth2_client"])
      end

      register("organization.organization_application_service") do
        Application::Organization::OrganizationApplicationService.new(
          organization_repo: Container.resolve("gateway.organization_repo"),
          project_repo: Container.resolve("gateway.project_repo")
        )
      end
    end
  end
end
