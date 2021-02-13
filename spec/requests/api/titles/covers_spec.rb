require "rails_helper"

RSpec.describe Api::Titles::CoversController do
  describe ".index" do
    it "returns valid response" do
      title = create(:title)
      other_title = create(:title)
      _other_title_cover = create(:resource_cover, resource: other_title).cover
      first_cover = create(:resource_cover, resource: title).cover
      second_cover = create(:resource_cover, resource: title).cover
      third_cover = create(:resource_cover, resource: title).cover
      _fourth_cover = create(:resource_cover, resource: title).cover

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/titles/#{title.to_param}/covers.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/titles/covers_controller/index/200")
      expect(response).to have_objects_collection(first_cover, second_cover, third_cover)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)
      cover = create(:resource_cover, resource: title).cover

      get "/api/titles/#{title.to_param}/covers/#{cover.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/covers_controller/show/200")
    end
  end
end
