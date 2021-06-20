require "rails_helper"

RSpec.describe Api::Books::Chapters::Pages::ViewsController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)
      page = create(:page, chapter: chapter)

      post "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/pages/#{page.to_param}/views.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/pages/views_controller/create/200")
    end
  end
end
