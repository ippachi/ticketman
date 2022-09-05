# typed: strict

require "sinatra/base"
require "sorbet-runtime"

module Ticketman
  module Web
    class API < Sinatra::Application
      extend T::Sig

      get "/" do
        status 200
      end
    end
  end
end
