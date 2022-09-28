# frozen_string_literal: true
# typed: true

module Ticketman
  module Domain
    module Model
      module Workspace
        class WorkspaceTest < TestCase
          def test_create_workspace
            assert_equal Workspace, create_workspace.class
          end

          def test_create_project
            assert_equal Project, create_workspace.create_project(name: "test project").class
          end

          private

          def create_workspace
            WorkspaceFactory.create(id: "hoge", name: "test")
          end
        end
      end
    end
  end
end
