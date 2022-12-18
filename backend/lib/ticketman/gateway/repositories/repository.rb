# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class Repository
        class NotFoundError < StandardError; end

        class DuplicateKeyError < Application::Errors::DuplicateKeyError; end

        def save(entity, upsert: true)
          if upsert
            @relation.upsert(entity.to_h)
          else
            @relation.insert(entity.to_h)
          end
        rescue Mongo::Error::OperationFailure => e
          raise DuplicateKeyError if e.code == 11_000

          # :nocov:
          raise e
          # :nocov:
        end

        def find(id)
          result = find_or_nil(id)
          raise NotFoundError unless result

          result
        end

        def find_or_nil(id)
          result = @relation.find(id.to_s)
          result ? build(result) : nil
        end

        private

        def build(attributes) = attributes
      end
    end
  end
end
