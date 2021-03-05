require "rails_helper"

RSpec.describe Api::Groups::CreateFavorite do
  describe ".call" do
    it "does what it should" do
      group = create(:group)
      user = create(:user)

      service = described_class.new(
        group: group,
        user: user
      )

      service.call

      expect(group.favorites.count).to eq(1)
      expect(user.favorites.count).to eq(1)
    end
  end
end
