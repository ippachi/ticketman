# frozen_string_literal: true

class TestCase < Test::Unit::TestCase
  def setup
    Ticketman::Container.enable_stubs!
  end

  def teardown
    Ticketman::Container["gateway.mongo_client"].collections.each(&:delete_many)
    Ticketman::Container.unstub
  end
end
