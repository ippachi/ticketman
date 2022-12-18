# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class UserRepository < Repository
        def initialize(relation: Relations::Users.new)
          super()
          @relation = relation
        end

        private

        def build(attributes) = Domain::Model::User.new(**attributes)
      end
    end
  end
end
