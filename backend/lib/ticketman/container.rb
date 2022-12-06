# frozen_string_literal: true

require "dry/container"
require "dry/inflector"


module Ticketman
  class Container
    inflector = Dry::Inflector.new

    extend Dry::Container::Mixin
    namespace("gateway") do
      register("mongo_client", memoize: true) do
        Mongo::Client.new(
          [ENV.fetch("DATABASE_HOST", nil)], user: ENV.fetch("DATABASE_USER", nil),
                                             password: ENV.fetch("DATABASE_PASSWORD", nil),
                                             database: ENV.fetch("DATABASE_NAME", nil)
        )
      end

      %i[organization project].each do |name|
        classify_name = inflector.classify(name)
        pluralize_name = inflector.pluralize(name)
        register("#{name}_query") do
          Gateway::Queries.const_get("#{classify_name}Query").new(resolve(pluralize_name))
        end

        register("#{name}_repo") do
          Gateway::Repositories.const_get("#{classify_name}Repository").new(resolve(pluralize_name))
        end

        register(pluralize_name) do
          Gateway::Relations.const_get(inflector.pluralize(classify_name)).new(resolve("mongo_client"))
        end
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
