require "rails_helper"

RSpec.describe Api::FormatsController do
  describe ".index" do
    it "returns valid response" do
      first_format = create(:format, tag: create(:tag, title: "A"))
      second_format = create(:format, tag: create(:tag, title: "B"))
      third_format = create(:format, tag: create(:tag, title: "C"))

      get "/api/formats.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/formats_controller/index/200")
      expect(response).to have_objects_collection(first_format, second_format, third_format)
    end
  end

  describe ".show" do
    it "returns valid response" do
      format = create(:format)

      get "/api/formats/#{format.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/formats_controller/show/200")
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

        post "/api/formats.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/formats_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
        format = create(:format)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        put "/api/formats/#{format.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/formats_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      format = create(:format)

      delete "/api/formats/#{format.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
