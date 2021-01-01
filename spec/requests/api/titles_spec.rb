require "rails_helper"

RSpec.describe Api::TitlesController do
  describe ".index" do
    it "returns valid response" do
      first_title = create(:title, title: "A")
      second_title = create(:title, title: "B")
      third_title = create(:title, title: "C")

      get "/api/titles.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles_controller/index/200")

      # Ensure that titles sorted by title ASC
      expect(response).to have_objects_collection(first_title, second_title, third_title)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)

      get "/api/titles/#{title.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles_controller/show/200")
    end
  end
end
