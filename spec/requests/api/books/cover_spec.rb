require "rails_helper"

RSpec.describe Api::Books::CoverController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      params = {
        file: Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg", "image/jpeg"),
      }

      put "/api/books/#{book.to_param}/cover.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/cover_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      delete "/api/books/#{book.to_param}/cover.json"

      expect(response).to have_http_status(204)
    end
  end
end
