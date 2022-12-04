# frozen_string_literal: true

begin
  require "dotenv"
  Dotenv.load(".env.local", ".env.#{ENV.fetch('APP_ENV', 'development')}")
rescue StandardError
  nil
end
