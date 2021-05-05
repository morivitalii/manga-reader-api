require "rails_helper"

RSpec.describe Api::FilterFavorites do
  describe ".call" do
    context "resource type" do
      it "does what it should" do
        first_favorite = create(:title_favorite)
        second_favorite = create(:title_favorite)
        _third_favorite = create(:group_favorite)
        _fourth_favorite = create(:artist_favorite)

        params = Api::Favorites::IndexParams.new(
          [:resource_type],
          { resource_type: "Title" }
        )

        service = described_class.new(
          scope: Favorite.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.favorites).to eq([first_favorite, second_favorite])
      end
    end

    context "resource type and ids" do
      it "does what it should" do
        first_favorite = create(:title_favorite)
        second_favorite = create(:title_favorite)
        _third_favorite = create(:title_favorite)
        _third_favorite = create(:group_favorite)
        _fourth_favorite = create(:artist_favorite)

        params = Api::Favorites::IndexParams.new(
          [
            :resource_type,
            :resource_ids
          ],
          {
            resource_type: "Title",
            resource_ids: [
              first_favorite.title_id,
              second_favorite.title_id
            ]
          }
        )

        service = described_class.new(
          scope: Favorite.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.favorites).to eq([first_favorite, second_favorite])
      end
    end
  end
end
