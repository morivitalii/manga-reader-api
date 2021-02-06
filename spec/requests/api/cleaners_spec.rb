require "rails_helper"

RSpec.describe Api::CleanersController do
  describe ".index" do
    it "returns valid response" do
      first_cleaner = create(:cleaner)
      second_cleaner = create(:cleaner)
      third_cleaner = create(:cleaner)
      _fourth_cleaner = create(:cleaner)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/cleaners.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/cleaners_controller/index/200")
      expect(response).to have_objects_collection(first_cleaner, second_cleaner, third_cleaner)
    end
  end

  describe ".show" do
    it "returns valid response" do
      cleaner = create(:cleaner)

      get "/api/cleaners/#{cleaner.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/cleaners_controller/show/200")
    end
  end
end
