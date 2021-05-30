require "rails_helper"

RSpec.describe Api::MarksController do
  describe ".index" do
    it "returns valid response" do
      first_mark = create(:mark, tag: create(:tag, title: "A"))
      second_mark = create(:mark, tag: create(:tag, title: "B"))
      third_mark = create(:mark, tag: create(:tag, title: "C"))

      get "/api/marks.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/marks_controller/index/200")
      expect(response).to have_objects_collection(first_mark, second_mark, third_mark)
    end
  end

  describe ".show" do
    it "returns valid response" do
      mark = create(:mark)

      get "/api/marks/#{mark.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/marks_controller/show/200")
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

        post "/api/marks.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/marks_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_settings_access_right = create(:manage_system_settings_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
        mark = create(:mark)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        put "/api/marks/#{mark.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/marks_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_settings_access_right = create(:manage_system_settings_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_settings_access_right, user: current_user)
      mark = create(:mark)

      delete "/api/marks/#{mark.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
