# typed: true

require "test_helper"
require "mongo"

class MongoTest < Test::Unit::TestCase
  def test_save_and_find_data
    client = Mongo::Client.new(["127.0.0.1:27017"], user: "ticketman", password: "password", database: "ticketmanTestDB")
    client[:workspaces].insert_one(id: "1", name: "name")
    assert_equal "name", client[:workspaces].find(id: "1").first[:name]
  end
end
