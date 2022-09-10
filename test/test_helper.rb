require "warning"

Gem.path.each do |path|
  Warning.ignore(//, path)
end

Warning.ignore(%r{warning: loading in progress, circular require considered harmful - .*/cgi/util.rb})

require "test/unit"
require "ticketman"
