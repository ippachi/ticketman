# frozen_string_literal: true

require "test_helper"

module Ticketman
  module Gateway
    module Repositories
      class OrganizationRepositoryTest < TestCase
        def setup
          @user = Domain::Model::User.new(name: "test")
          UserRepository.new.save(@user)
          @organization = Application::Organization::OrganizationApplicationService.new.create_organization(
            @user, id: "hoge", name: "name"
          )
        end

        def test_find_user_organization
          assert OrganizationRepository.new.find_owner_organization(owner_id: @user.id,
                                                                    organization_id: @organization.id)
        end
      end
    end
  end
end
