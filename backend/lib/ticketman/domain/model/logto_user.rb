# frozen_string_literal: true

module Ticketman
  module Domain
    module Model
      class LogtoUser < Entity
        attr_reader :user_id

        def initialize(id:, user_id:)
          super()
          @id = id
          @user_id = user_id
        end

        def to_h = { id: @id, user_id: @user_id }
      end
    end
  end
end
