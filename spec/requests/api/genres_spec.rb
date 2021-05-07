require "rails_helper"

RSpec.describe Api::GenresController do
  describe ".index" do
    it "returns valid response" do
      first_genre = create(:genre, tag: create(:tag, title: "A"))
      second_genre = create(:genre, tag: create(:tag, title: "B"))
      third_genre = create(:genre, tag: create(:tag, title: "C"))

      get "/api/genres.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/genres_controller/index/200")
      expect(response).to have_objects_collection(first_genre, second_genre, third_genre)
    end
  end

  describe ".show" do
    it "returns valid response" do
      genre = create(:genre)

      get "/api/genres/#{genre.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/genres_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_content_access_right = create(:manage_system_content_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_content_access_right, user: current_user)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        post "/api/genres.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/genres_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        manage_system_content_access_right = create(:manage_system_content_access_right)
        _user_access_right = create(:user_access_right, access_right: manage_system_content_access_right, user: current_user)
        genre = create(:genre)

        params = {
          key: "key",
          title: "Title",
          description: "Description"
        }

        put "/api/genres/#{genre.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/genres_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      manage_system_content_access_right = create(:manage_system_content_access_right)
      _user_access_right = create(:user_access_right, access_right: manage_system_content_access_right, user: current_user)
      genre = create(:genre)

      delete "/api/genres/#{genre.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
