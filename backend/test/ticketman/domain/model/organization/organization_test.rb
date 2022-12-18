# frozen_string_literal: true
# typed: true

module Ticketman
  module Domain
    module Model
      module Organization
        class OrganizationTest < TestCase
          def test_create_organization
            assert_equal Organization, Organization.new(id: "hoge", name: "test").class
          end

          data("with valid", %w[test test assert_nothing_raised])
          data("with empty id", ["", "test", "assert_raise"])
          data("with contain symbol id", ["id$", "test", "assert_raise"])
          data("with 2 letters id", %w[id test assert_raise])
          data("with 33 letters id", ["i" * 33, "test", "assert_raise"])
          data("with start hyphen id", ["-id", "test", "assert_raise"])
          data("with empty name", ["test", "", "assert_raise"])
          def test_verification(data)
            id, name, assertion = data
            method(assertion).call do
              Organization.new(id:, name:)
            end
          end
        end
      end
    end
  end
end
