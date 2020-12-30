require "rails_helper"

RSpec.describe Api::Tags::TranslationsController do
  describe ".show" do
    it "returns valid response" do
      tag = create(:tag)

      get "/api/tags/#{tag.to_param}/translations.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/tags/translations_controller/show/200")
    end
  end
end
