# frozen_string_literal: true

module Ticketman
  module Web
    module GraphQL
      module Types
        class Organization < BaseObject
          field :id, ID, null: false
          field :name, String, null: false
        end
      end
    end
  end
end
