# frozen_string_literal: true
# typed: strict

require "sinatra/base"
require "sinatra/json"
require "rack/cors"
require "rack/contrib"

module Ticketman
  module Web
    class API < Sinatra::Application
      extend T::Sig

      use Rack::Cors do
        T.bind(self, Rack::Cors)

        allow do
          T.bind(self, Rack::Cors::Resources)

          origins "http://hoge.lvh.me:3000"
          resource "*", headers: :any, methods: [:post]
        end
      end

      use Rack::JSONBodyParser

      post "/graphql" do
        if params[:query]
          result = Ticketman::Web::GraphQL::Schema.execute(params[:query], variables: params[:variables])
          json(result)
        else
          Ticketman::Web::GraphQL::Schema.to_json
        end
      end
    end
  end
end
