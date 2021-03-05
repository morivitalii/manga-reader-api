require "rails_helper"

RSpec.describe Api::Titles::Chapters::BookmarksController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)

      post "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/bookmarks.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/bookmarks_controller/create/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      bookmark = create(:bookmark, user: current_user, resource: chapter)

      delete "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/bookmarks/#{bookmark.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
