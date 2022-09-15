# frozen_string_literal: true
# typed: strict

require "sinatra/base"
require "sinatra/json"

module Ticketman
  module Web
    class API < Sinatra::Application
      extend T::Sig

      get "/workspaces/:id" do
        workspace_query = T.let(Container["gateway.workspace_query"], WorkspaceQuery)
        workspace = workspace_query.find(params[:id])
        json(workspace)
      end

      post "/workspaces" do
        workspace = Container["application.workspace.workspace_application_service"].create_workspace(params[:id],
                                                                                                      params[:name])
        [201, json(workspace.serialize)]
      end
    end
  end
end
