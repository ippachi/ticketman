# frozen_string_literal: true

module Ticketman
  module Gateway
    MongoClient = Mongo::Client.new(
      [ENV.fetch("DATABASE_HOST", nil)], user: ENV.fetch("DATABASE_USER", nil),
                                         password: ENV.fetch("DATABASE_PASSWORD", nil),
                                         database: ENV.fetch("DATABASE_NAME", nil)
    )
  end
end
