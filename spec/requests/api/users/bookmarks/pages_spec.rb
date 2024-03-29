require "rails_helper"

RSpec.describe Api::Users::Bookmarks::PagesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_bookmark = create(:page_bookmark, user: current_user)
      second_bookmark = create(:page_bookmark, user: current_user)
      third_bookmark = create(:page_bookmark, user: current_user)
      _other_user_bookmark = create(:page_bookmark)

      params = {}
      pagination_params = {
        page: 1,
        limit: 2
      }

      params.merge!(pagination_params)

      get "/api/users/bookmarks/pages.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/bookmarks/pages_controller/index/200")
      expect(response).to have_objects_collection(third_bookmark.resource, second_bookmark.resource)
    end
  end
end
