require "rails_helper"

RSpec.describe Api::WritersController do
  describe ".index" do
    it "returns valid response" do
      first_writer = create(:writer)
      second_writer = create(:writer)
      third_writer = create(:writer)
      _fourth_writer = create(:writer)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/writers.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/writers_controller/index/200")
      expect(response).to have_objects_collection(first_writer, second_writer, third_writer)
    end
  end

  describe ".show" do
    it "returns valid response" do
      writer = create(:writer)

      get "/api/writers/#{writer.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/writers_controller/show/200")
    end
  end
end
