require "rails_helper"

RSpec.describe Api::TranslatorsController do
  describe ".index" do
    it "returns valid response" do
      first_translator = create(:translator)
      second_translator = create(:translator)
      third_translator = create(:translator)
      _fourth_translator = create(:translator)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/translators.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/translators_controller/index/200")
      expect(response).to have_objects_collection(first_translator, second_translator, third_translator)
    end
  end

  describe ".show" do
    it "returns valid response" do
      translator = create(:translator)

      get "/api/translators/#{translator.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/translators_controller/show/200")
    end
  end
end
