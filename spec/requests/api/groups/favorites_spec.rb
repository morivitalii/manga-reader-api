require "rails_helper"

RSpec.describe Api::Groups::FavoritesController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      group = create(:group)

      post "/api/groups/#{group.to_param}/favorites.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/groups/favorites_controller/create/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      group = create(:group)
      favorite = create(:favorite, user: current_user, resource: group)

      delete "/api/groups/#{group.to_param}/favorites/#{favorite.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
