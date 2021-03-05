require "rails_helper"

RSpec.describe Api::Groups::DeleteFavorite do
  describe ".call" do
    it "does what it should" do
      group = create(:group)
      favorite = create(:favorite, resource: group)

      service = described_class.new(
        favorite: favorite
      )

      service.call

      expect(group.favorites.count).to eq(0)
    end
  end
end
