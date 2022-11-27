# frozen_string_literal: true
# typed: true

module Ticketman
  module Domain
    module Model
      module Organization
        class ProjectTest < TestCase
          def test_create_project
            assert_equal Project, ProjectFactory.create(name: "test project").class
          end

          def test_verification
            assert_raise do
              ProjectFactory.create(name: "")
            end
          end
        end
      end
    end
  end
end
