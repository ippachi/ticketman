# frozen_string_literal: true
# typed: true

require "test_helper"
require "mongo"

class MongoTest < TestCase
  def test_save_and_find_data
    client = Mongo::Client.new(["127.0.0.1:27017"], user: "ticketman", password: "password",
                                                    database: "ticketmanTestDB")
    workspaces = client[:workspaces]
    workspaces.insert_one(id: "1", name: "name")
    assert_equal "name", workspaces.find(id: "1").first[:name]
  end
end
