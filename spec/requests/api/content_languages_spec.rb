require "rails_helper"

RSpec.describe Api::ContentLanguagesController do
  describe ".index" do
    it "returns valid response" do
      # Entries creation skipped because english and russian content languages created through rspec contexts
      # That is enough for this spec

      get "/api/content_languages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/content_languages_controller/index/200")
    end
  end

  describe ".show" do
    it "returns valid response" do
      # Entries creation skipped because english content language created through rspec contexts
      # That is enough for this spec

      get "/api/content_languages/#{Current.content_language.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/content_languages_controller/show/200")
    end
  end
end
