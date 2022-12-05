# frozen_string_literal: true
# typed: strict

module Ticketman
  module Application
    module OAuth2Client
      extend T::Sig
      extend T::Helpers

      interface!

      sig { abstract.params(state: String, nonce: String, code_verifier: String).returns(String) }
      def authorize_url(state:, nonce:, code_verifier:); end

      sig { abstract.params(code: String, code_verifier: String).returns(T.untyped) }
      def get_token(code, code_verifier); end
    end
  end
end
