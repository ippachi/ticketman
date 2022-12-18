# frozen_string_literal: true

require "test_helper"

module Ticketman
  module Domain
    module Model
      class UserTest < TestCase
        def test_create_organization
          user = User.new(name: "test")
          assert_equal Organization::Organization, user.create_organization(id: "test", name: "test").class
        end
      end
    end
  end
end
