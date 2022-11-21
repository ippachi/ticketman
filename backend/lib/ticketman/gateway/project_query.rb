# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class ProjectQuery
      extend T::Sig

      sig { params(projects: Projects).void }
      def initialize(projects)
        @projects = projects
      end

      sig { params(id: String).returns(T.untyped) }
      def find(id)
        @projects.find(id)
      end
    end
  end
end
