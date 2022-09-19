# frozen_string_literal: true
# typed: strict

require "sinatra/base"
require "sinatra/json"

module Ticketman
  module Web
    class API < Sinatra::Application
      extend T::Sig

      post "/graphql" do
        if params[:query]
          result = Ticketman::Web::GraphQL::Schema.execute(params[:query])
          json(result)
        else
          Ticketman::Web::GraphQL::Schema.to_json
        end
      end
    end
  end
end
