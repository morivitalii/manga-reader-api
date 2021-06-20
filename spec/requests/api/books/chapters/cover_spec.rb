require "rails_helper"

RSpec.describe Api::Books::Chapters::CoverController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)

      params = {
        file: Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg"),
      }

      put "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/cover.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/cover_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)

      delete "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/cover.json"

      expect(response).to have_http_status(204)
    end
  end
end
