require "rails_helper"

RSpec.describe Api::Users::Titles::FavoritesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_favorite = create(:title_favorite, user: current_user)
      second_favorite = create(:title_favorite, user: current_user)
      third_favorite = create(:title_favorite, user: current_user)

      params = {
        filter: {
          ids: [second_favorite.resource_id, third_favorite.resource_id]
        }
      }

      get "/api/users/titles/favorites.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/titles/favorites_controller/index/200")
      expect(response).to have_objects_collection(second_favorite, third_favorite)
    end
  end
end
