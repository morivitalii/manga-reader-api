require "rails_helper"

RSpec.describe Api::TagsController do
  describe ".index" do
    it "returns valid response" do
      first_tag = create(:tag, title: "A")
      second_tag = create(:tag, title: "B")
      third_tag = create(:tag, title: "C")

      get "/api/tags.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/tags_controller/index/200")
      expect(response).to have_objects_collection(first_tag, second_tag, third_tag)
    end
  end

  describe ".show" do
    it "returns valid response" do
      tag = create(:tag)

      get "/api/tags/#{tag.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/tags_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        grant_access_right(current_user, :manage_system_settings)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        post "/api/tags.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/tags_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        tag = create(:tag)

        grant_access_right(current_user, :manage_system_settings)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        put "/api/tags/#{tag.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/tags_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      tag = create(:tag)

      grant_access_right(current_user, :manage_system_settings)

      delete "/api/tags/#{tag.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
