require "rails_helper"

RSpec.describe Api::TitlesController do
  describe ".index" do
    it "returns valid response" do
      first_title = create(:title, title: "A")
      second_title = create(:title, title: "B")
      third_title = create(:title, title: "C")
      _fourth_title = create(:title, title: "D")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/titles.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/titles_controller/index/200")
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
