require "rails_helper"

RSpec.describe Api::ArtistsController do
  describe ".index" do
    it "returns valid response" do
      first_artist = create(:artist, name: "A")
      second_artist = create(:artist, name: "B")
      third_artist = create(:artist, name: "C")
      _fourth_artist = create(:artist, name: "D")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/artists.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/artists_controller/index/200")
      expect(response).to have_objects_collection(first_artist, second_artist, third_artist)
    end
  end

  describe ".show" do
    it "returns valid response" do
      artist = create(:artist)

      get "/api/artists/#{artist.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/artists_controller/show/200")
    end
	end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        user = create(:user)

        grant_access_right(current_user, :manage_system_settings)

        params = {
					user_id: user.id,
					name: "Name"
        }

        post "/api/artists.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/artists_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
				artist = create(:artist)
        user = create(:user)

        grant_access_right(current_user, :manage_system_settings)

        params = {
          user_id: user.id,
          name: "Name"
        }

        put "/api/artists/#{artist.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/artists_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      artist = create(:artist)

      grant_access_right(current_user, :manage_system_settings)

      delete "/api/artists/#{artist.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
