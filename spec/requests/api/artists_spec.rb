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
end
