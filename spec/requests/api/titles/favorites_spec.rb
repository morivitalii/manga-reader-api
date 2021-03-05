require "rails_helper"

RSpec.describe Api::Titles::FavoritesController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)

      post "/api/titles/#{title.to_param}/favorites.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/favorites_controller/create/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      favorite = create(:favorite, user: current_user, resource: title)

      delete "/api/titles/#{title.to_param}/favorites/#{favorite.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
