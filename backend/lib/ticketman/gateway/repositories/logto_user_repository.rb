# frozen_string_literal: true

module Ticketman
  module Gateway
    module Repositories
      class LogtoUserRepository < Repository
        def initialize(relation: Relations::LogtoUsers.new)
          super()
          @relation = relation
        end

        private

        def build(attributes) = Domain::Model::LogtoUser.new(**attributes)
      end
    end
  end
end
