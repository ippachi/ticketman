# frozen_string_literal: true

module Ticketman
  module Gateway
    class MongoClient
      extend Forwardable

      CONNECTION = Mongo::Client.new(
        [ENV.fetch("DATABASE_HOST", nil)], user: ENV.fetch("DATABASE_USER", nil),
                                           password: ENV.fetch("DATABASE_PASSWORD", nil),
                                           database: ENV.fetch("DATABASE_NAME", nil)
      )

      def initialize
        @conn = CONNECTION
      end

      delegate :[] => :@conn

      def transaction(&) = @conn.start_session(&)
    end
  end
end
