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

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        post "/api/themes.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/themes_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
        theme = create(:theme)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        put "/api/themes/#{theme.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/themes_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      theme = create(:theme)

      delete "/api/themes/#{theme.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
