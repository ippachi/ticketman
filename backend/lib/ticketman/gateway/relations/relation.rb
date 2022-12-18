# frozen_string_literal: true

module Ticketman
  module Gateway
    module Relations
      class Relation
        def initialize(client: MongoClient.new)
          @client = client
        end

        def find(id)
          result = @client[name].find(id:).first
          result ? result.to_h.transform_keys(&:to_sym).except(:_id) : nil
        end

        def insert(attributes)
          @client[name].insert_one(attributes)
        end

        def upsert(attributes)
          @client[name].update_one({ id: attributes[:id] }, { "$set": attributes }, { upsert: true })
        end
      end
    end
  end
end
