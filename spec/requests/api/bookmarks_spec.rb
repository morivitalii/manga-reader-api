require "rails_helper"

RSpec.describe Api::BookmarksController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_bookmark = create(:book_bookmark, user: current_user)
      second_bookmark = create(:book_bookmark, user: current_user)
      third_bookmark = create(:chapter_bookmark, user: current_user)
      forth_bookmark = create(:page_bookmark, user: current_user)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/bookmarks.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/bookmarks_controller/index/200")
      expect(response).to have_objects_collection(forth_bookmark, third_bookmark, second_bookmark)
    end
  end
end
