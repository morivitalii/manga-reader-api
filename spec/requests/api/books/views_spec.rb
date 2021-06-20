require "rails_helper"

RSpec.describe Api::Books::ViewsController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      post "/api/books/#{book.to_param}/views.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/views_controller/create/200")
    end
  end
end
