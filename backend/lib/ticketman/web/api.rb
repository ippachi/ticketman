# frozen_string_literal: true

require "sinatra/base"
require "sinatra/json"
require "rack/cors"
require "rack/contrib"
require "rack"
require "rack/session/redis"

ENV["RACK_ENV"] = ENV.fetch("APP_ENV", nil)

module Ticketman
  module Web
    class API < Sinatra::Application
      use Rack::Cors do
        allow do
          origins ENV.fetch("CLIENT_URL", nil)
          resource "*", headers: :any, methods: [:post], credentials: true
        end
      end

      use Rack::JSONBodyParser
      use Rack::Session::Redis, redis_server: ENV.fetch("REDIS_SESSION_SERVER", nil)

      post "/graphql" do
        if params[:query]
          result = Ticketman::Web::GraphQL::Schema.execute(
            params[:query],
            variables: params[:variables],
            context: { session: }
          )
          json(result)
        else
          Ticketman::Web::GraphQL::Schema.to_json
        end
      end

      get "/health" do
        # :nocov:
        "ok"
        # :nocov:
      end
    end
  end
end
