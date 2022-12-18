# frozen_string_literal: true
# typed: true

require "test_helper"
require "mongo"

class MongoTest < TestCase
  def test_save_and_find_data
    client = Ticketman::Gateway::MongoClient.new
    organizations = client[:organizations]
    organizations.insert_one(id: "1", name: "name", owner_id: "test")
    assert_equal "name", organizations.find(id: "1").first[:name]
  end
end
