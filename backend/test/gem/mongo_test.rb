# frozen_string_literal: true
# typed: true

require "test_helper"
require "mongo"

class MongoTest < TestCase
  def test_save_and_find_data
    client = Ticketman::Container.resolve("gateway.mongo_client")
    workspaces = client[:workspaces]
    workspaces.insert_one(id: "1", name: "name")
    assert_equal "name", workspaces.find(id: "1").first[:name]
  end
end
