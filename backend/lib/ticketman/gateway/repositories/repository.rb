# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class Repository
        class NotFoundError < StandardError; end

        class DuplicateKeyError < Application::Errors::DuplicateKeyError; end

        def save(entity)
          @relation.insert_one(entity.serialize)
        rescue Mongo::Error::OperationFailure => e
          raise DuplicateKeyError if e.code == 11_000
        end

        def find(id)
          result = @relation.find(id.to_s)
          raise NotFoundError unless result

          build(result)
        end
      end
    end
  end
end
