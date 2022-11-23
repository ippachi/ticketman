# frozen_string_literal: true
# typed: strict

module Ticketman
  module Gateway
    class ProjectQuery < Query
      sig { params(projects: Projects).void }
      def initialize(projects)
        super
        @projects = projects
      end
    end
  end
end
