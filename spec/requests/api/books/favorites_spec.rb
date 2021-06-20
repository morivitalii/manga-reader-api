require "rails_helper"

RSpec.describe Api::Books::FavoritesController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      post "/api/books/#{book.to_param}/favorites.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/favorites_controller/create/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      favorite = create(:favorite, user: current_user, resource: book)

      delete "/api/books/#{book.to_param}/favorites/#{favorite.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
