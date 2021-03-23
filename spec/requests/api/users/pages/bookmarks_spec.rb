require "rails_helper"

RSpec.describe Api::Users::Pages::BookmarksController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_bookmark = create(:page_bookmark, user: current_user)
      second_bookmark = create(:page_bookmark, user: current_user)
      third_bookmark = create(:page_bookmark, user: current_user)

      params = {
        filter: {
          ids: [second_bookmark.resource_id, third_bookmark.resource_id]
        }
      }

      get "/api/users/pages/bookmarks.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/pages/bookmarks_controller/index/200")
      expect(response).to have_objects_collection(second_bookmark, third_bookmark)
    end
  end
end
