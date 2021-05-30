require "rails_helper"

RSpec.describe Api::LocalesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      first_locale = create(:locale)
      second_locale = create(:locale)
      third_locale = create(:locale)

      get "/api/locales.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/locales_controller/index/200")
      expect(response).to have_objects_collection(first_locale, second_locale, third_locale)
    end
  end

  describe ".show", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      locale = create(:locale)

      get "/api/locales/#{locale.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/locales_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)

        params = {
          key: "uk"
        }

        post "/api/locales.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/locales_controller/create/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      locale = create(:locale)

      delete "/api/locales/#{locale.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
