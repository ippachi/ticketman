# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class Repository
      class NotFoundError < StandardError; end

      class DuplicateKeyError < StandardError
        include Application::Errors::DuplicateKeyError
      end

      extend T::Sig
      extend T::Helpers

      abstract!

      sig { params(relation: Relation).void }
      def initialize(relation)
        @relation = relation
      end

      sig { params(entity: Domain::Model::Entity).void }
      def save(entity)
        @relation.insert_one(entity.serialize)
      rescue Mongo::Error::OperationFailure => e
        raise DuplicateKeyError if e.code == 11_000
      end

      sig { params(id: T.any(String, Domain::Model::Identifier)).returns(Domain::Model::Entity) }
      def find(id)
        result = @relation.find(id.to_s)
        raise NotFoundError unless result
        result
        build(result)
      end

      private

      sig { abstract.params(attributes: T::Hash[Symbol, T.untyped]).returns(Domain::Model::Entity) }
      def build(attributes); end
    end
  end
end
