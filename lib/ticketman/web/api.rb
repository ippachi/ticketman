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
    end
  end
end
