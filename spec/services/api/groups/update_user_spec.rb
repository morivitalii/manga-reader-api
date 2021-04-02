require "rails_helper"

RSpec.describe Api::Groups::UpdateUser do
  describe ".call" do
    it "does what it should" do
      group_user = create(:group_user)
      access_right = create(:manage_group_access_right)

      service = described_class.new(
        group_user: group_user,
        access_rights: [access_right.key]
      )

      response = service.call

      expect(response).to be_truthy
      expect(service.group_user.group_access_rights).to include(access_right)
    end
  end
end
