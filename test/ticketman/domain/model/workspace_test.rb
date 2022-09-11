# frozen_string_literal: true
# typed: true

module Ticketman
  module Domain
    module Model
      class WorkspaceTest < Test::Unit::TestCase
        def test_create_workspace
          assert Workspace::Workspace.new(id: Workspace::WorkspaceID.new("hoge"),
                                          name: "test").is_a?(Workspace::Workspace)
        end
      end
    end
  end
end
