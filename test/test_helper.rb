require "warning"

Gem.path.each do |path|
  Warning.ignore(//, path)
end

require "test/unit"
require_relative "../lib/ticketman/web/api"
