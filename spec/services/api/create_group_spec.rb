require "rails_helper"

RSpec.describe Api::CreateGroup do
  describe ".call" do
    it "does what it should" do
      user = create(:user)
      create(:manage_users_group_access_right)
      create(:manage_chapters_group_access_right)

      service = described_class.new(
        user: user,
        title: "Title"
      )

      result = service.call

      expect(result).to be_truthy
      expect(Group.count).to eq(1)
      expect(service.group.group_users.count).to eq(1)
      expect(GroupUserAccessRight.count).to eq(2)
    end
  end
end
