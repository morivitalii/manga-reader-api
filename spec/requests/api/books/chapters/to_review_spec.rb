require "rails_helper"

RSpec.describe Api::Books::Chapters::ToReviewController do
  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:draft_chapter, book: book)

      put "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/to_review.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/to_review_controller/update/200")
    end
  end
end
