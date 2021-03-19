require "rails_helper"

RSpec.describe Api::Users::SettingsController do
  describe ".show", context: :as_signed_in_user do
    it "returns valid response" do
      create(:user_setting, user: current_user)

      get "/api/users/settings.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/settings_controller/show/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      create(:user_setting, user: current_user)
      interface_language = create(:interface_language)
      content_languages = create_list(:content_language, 2)
      tags = create_list(:tag, 2)

      params = {
        name: "Name",
        surname: "Surname",
        sex: "other",
        avatar: Rack::Test::UploadedFile.new("spec/fixtures/avatar.jpg"),
        interface_language_id: interface_language.id,
        content_language_ids: content_languages.map(&:id),
        excluded_tag_ids: tags.map(&:id)
      }

      put "/api/users/settings.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/settings_controller/update/200")
    end
  end
end
