require "rails_helper"

RSpec.describe Api::Artists::CreateFavorite do
  describe ".call" do
    it "does what it should" do
      artist = create(:artist)
      user = create(:user)

      service = described_class.new(
        artist: artist,
        user: user
      )

      service.call

      expect(artist.favorites.count).to eq(1)
      expect(user.favorites.count).to eq(1)
    end
  end
end
