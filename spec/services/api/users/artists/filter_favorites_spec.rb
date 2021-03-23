require "rails_helper"

RSpec.describe Api::Users::Artists::FilterFavorites do
  describe ".call" do
    it "does what it should" do
      _first_favorite = create(:artist_favorite)
      second_favorite = create(:artist_favorite)
      third_favorite = create(:artist_favorite)

      service = described_class.new(
        scope: Favorite.all,
        filter: {
          ids: [
            second_favorite.resource_id,
            third_favorite.resource_id
          ]
        }
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.favorites).to eq([second_favorite, third_favorite])
    end
  end
end
