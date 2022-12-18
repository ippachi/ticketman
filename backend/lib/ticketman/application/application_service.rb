# frozen_string_literal: true

module Ticketman
  module Application
    class ApplicationService
      def initialize(db_client: Gateway::MongoClient.new)
        @db_client = db_client
      end

      private

      def transaction(&) = @db_client.transaction(&)
    end
  end
end
