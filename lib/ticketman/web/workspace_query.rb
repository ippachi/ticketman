# frozen_string_literal: true
# typed: strict

module Ticketman
  module Web
    module WorkspaceQuery
      extend T::Sig
      extend T::Helpers

      interface!

      sig { abstract.params(id: String).returns(T.untyped) }
      def find(id); end
    end
  end
end
