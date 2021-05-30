require "rails_helper"

RSpec.describe Api::InterfaceLanguagesController do
  describe ".index" do
    it "returns valid response" do
      # Entries creation skipped because english and russian interface languages created through rspec contexts
      # That is enough for this spec

      get "/api/interface_languages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/interface_languages_controller/index/200")
    end
  end

  describe ".show" do
    it "returns valid response" do
      # Entries creation skipped because english interface language created through rspec contexts
      # That is enough for this spec

      get "/api/interface_languages/#{Current.interface_language.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/interface_languages_controller/show/200")
    end
	end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
				locale = create(:locale)

        params = {
					locale_id: locale.id,
          title: "Title"
        }

        post "/api/interface_languages.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/interface_languages_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
        interface_language = create(:interface_language)

        params = {
          title: "Title"
        }

        put "/api/interface_languages/#{interface_language.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/interface_languages_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      interface_language = create(:interface_language)

      delete "/api/interface_languages/#{interface_language.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
