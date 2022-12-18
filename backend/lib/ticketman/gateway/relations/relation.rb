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
          format_result(result)
        end

        def where(condition)
          result = @client[name].find(**condition).first
          format_result(result)
        end

        def insert(attributes)
          @client[name].insert_one(attributes)
        end

        def upsert(attributes)
          @client[name].update_one({ id: attributes[:id] }, { "$set": attributes }, { upsert: true })
        end

        private

        def format_result(result)
          result ? result.to_h.transform_keys(&:to_sym).except(:_id) : nil
        end
      end
    end
  end
end
