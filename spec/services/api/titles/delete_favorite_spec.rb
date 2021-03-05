require "rails_helper"

RSpec.describe Api::Titles::DeleteFavorite do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      favorite = create(:favorite, resource: title)

      service = described_class.new(
        favorite: favorite
      )

      service.call

      expect(title.favorites.count).to eq(0)
    end
  end
end
