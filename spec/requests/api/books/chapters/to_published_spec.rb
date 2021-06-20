require "rails_helper"

RSpec.describe Api::Books::Chapters::ToPublishedController do
  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:review_chapter, book: book)

      put "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/to_published.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/to_published_controller/update/200")
    end
  end
end
