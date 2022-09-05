# typed: strict

class Sinatra::Application
  class << self
    sig { params(path: String, opts: T.untyped, block: T.proc.bind(T.attached_class).void).void }
    def get(path, opts = T.unsafe(nil), &block); end
  end
end
