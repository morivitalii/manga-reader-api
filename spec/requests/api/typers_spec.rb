require "rails_helper"

RSpec.describe Api::TypersController do
  describe ".index" do
    it "returns valid response" do
      first_typer = create(:typer)
      second_typer = create(:typer)
      third_typer = create(:typer)
      _fourth_typer = create(:typer)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/typers.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/typers_controller/index/200")
      expect(response).to have_objects_collection(first_typer, second_typer, third_typer)
    end
  end

  describe ".show" do
    it "returns valid response" do
      typer = create(:typer)

      get "/api/typers/#{typer.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/typers_controller/show/200")
    end
  end
end
