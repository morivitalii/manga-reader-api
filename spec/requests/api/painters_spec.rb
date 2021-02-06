require "rails_helper"

RSpec.describe Api::PaintersController do
  describe ".index" do
    it "returns valid response" do
      first_painter = create(:painter)
      second_painter = create(:painter)
      third_painter = create(:painter)
      _fourth_painter = create(:painter)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/painters.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/painters_controller/index/200")
      expect(response).to have_objects_collection(first_painter, second_painter, third_painter)
    end
  end

  describe ".show" do
    it "returns valid response" do
      painter = create(:painter)

      get "/api/painters/#{painter.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/painters_controller/show/200")
    end
  end
end
