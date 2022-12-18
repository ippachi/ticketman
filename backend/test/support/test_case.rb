# frozen_string_literal: true

require "dry/inflector"

class TestCase < Test::Unit::TestCase
  def setup
    %i[organization project logto_user user].each do |name|
      instance_variable_set(:"@#{name}_repo",
                            Ticketman::Gateway::Repositories.const_get("#{inflector.classify(name)}Repository").new)
    end
  end

  def teardown
    Ticketman::Gateway::MongoClient::CONNECTION.collections.each(&:delete_many)
  end

  private

  def inflector = @inflector ||= Dry::Inflector.new
end
