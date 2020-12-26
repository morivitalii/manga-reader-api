require "rails_helper"

RSpec.describe InterfaceLanguagesController do
  describe ".index" do
    it "returns valid response" do
      # Entries creation skipped because english and russian interface languages created through rspec contexts
      # That is enough for this spec

      get "/interface_languages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/interface_languages_controller/index/200")
    end
  end

  describe ".show" do
    it "returns valid response" do
      # Entries creation skipped because english interface language created through rspec contexts
      # That is enough for this spec

      get "/interface_languages/#{english_interface_language.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/interface_languages_controller/show/200")
    end
  end
end
