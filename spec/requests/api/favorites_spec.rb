require "rails_helper"

RSpec.describe Api::FavoritesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_favorite = create(:title_favorite, user: current_user)
      second_favorite = create(:title_favorite, user: current_user)
      third_favorite = create(:group_favorite, user: current_user)
      forth_favorite = create(:artist_favorite, user: current_user)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/favorites.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/favorites_controller/index/200")
      expect(response).to have_objects_collection(forth_favorite, third_favorite, second_favorite)
    end
  end
end
