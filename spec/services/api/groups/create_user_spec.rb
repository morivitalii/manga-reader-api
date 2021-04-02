require "rails_helper"

RSpec.describe Api::Groups::CreateUser do
  describe ".call" do
    it "does what it should" do
      group = create(:group)
      user = create(:user)
      access_right = create(:manage_group_access_right)

      service = described_class.new(
        group: group,
        user_id: user.id,
        access_rights: [access_right.key]
      )

      response = service.call

      expect(response).to be_truthy
      expect(group.users.count).to eq(1)
      expect(service.group_user.group_access_rights).to include(access_right)
    end
  end
end
