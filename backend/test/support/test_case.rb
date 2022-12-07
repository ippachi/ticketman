# frozen_string_literal: true

class TestCase < Test::Unit::TestCase
  def teardown
    Ticketman::Gateway::MongoClient.collections.each(&:delete_many)
  end
end
