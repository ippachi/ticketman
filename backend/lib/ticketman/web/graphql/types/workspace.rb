# frozen_string_literal: true
# typed: strict

module Ticketman
  module Web
    module GraphQL
      module Types
        class Workspace < BaseObject
          field :id, ID, null: false
          field :name, String, null: false
        end
      end
    end
  end
end
