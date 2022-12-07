# frozen_string_literal: true

module Ticketman
  module Gateway
    module Relations
      class Relation
        def initialize(client: MongoClient)
          @client = client
        end

        def find(id)
          result = @client[name].find(id:).first
          result ? result.to_h.transform_keys(&:to_sym).except(:_id) : nil
        end

        def insert_one(attributes)
          @client[name].insert_one(attributes)
        end
      end
    end
  end
end
