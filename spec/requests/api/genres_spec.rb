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

      # Ensure that genres sorted by tag title ASC
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
end
