require "rails_helper"

RSpec.describe Api::Artists::DeleteFavorite do
  describe ".call" do
    it "does what it should" do
      artist = create(:artist)
      favorite = create(:favorite, resource: artist)

      service = described_class.new(
        favorite: favorite
      )

      service.call

      expect(artist.favorites.count).to eq(0)
    end
  end
end
