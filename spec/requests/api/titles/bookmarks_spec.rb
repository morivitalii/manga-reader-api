require "rails_helper"

RSpec.describe Api::Titles::BookmarksController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)

      post "/api/titles/#{title.to_param}/bookmarks.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/bookmarks_controller/create/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      bookmark = create(:bookmark, user: current_user, resource: title)

      delete "/api/titles/#{title.to_param}/bookmarks/#{bookmark.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
