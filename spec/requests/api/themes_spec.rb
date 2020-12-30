require "rails_helper"

RSpec.describe Api::ThemesController do
  describe ".index" do
    it "returns valid response" do
      first_theme = create(:theme, tag: create(:tag, title: "A"))
      second_theme = create(:theme, tag: create(:tag, title: "B"))
      third_theme = create(:theme, tag: create(:tag, title: "C"))

      get "/api/themes.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/themes_controller/index/200")

      # Ensure that themes sorted by tag title ASC
      expect(response).to have_objects_collection(first_theme, second_theme, third_theme)
    end
  end

  describe ".show" do
    it "returns valid response" do
      theme = create(:theme)

      get "/api/themes/#{theme.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/themes_controller/show/200")
    end
  end
end
