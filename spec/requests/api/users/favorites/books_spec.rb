require "rails_helper"

RSpec.describe Api::Users::Favorites::BooksController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_favorite = create(:book_favorite, user: current_user)
      second_favorite = create(:book_favorite, user: current_user)
      third_favorite = create(:book_favorite, user: current_user)
      _other_user_favorite = create(:book_favorite)

      params = {}
      pagination_params = {
        page: 1,
        limit: 2
      }

      params.merge!(pagination_params)

      get "/api/users/favorites/books.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/favorites/books_controller/index/200")
      expect(response).to have_objects_collection(third_favorite.resource, second_favorite.resource)
    end
  end
end
