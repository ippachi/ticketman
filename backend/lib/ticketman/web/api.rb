# frozen_string_literal: true
# typed: strict

require "sinatra/base"
require "sinatra/json"

module Ticketman
  module Web
    class API < Sinatra::Application
      extend T::Sig

      post "/graphql" do
        result = Ticketman::Web::GraphQL::Schema.execute(params[:query])
        json(result)
      end
    end
  end
end
