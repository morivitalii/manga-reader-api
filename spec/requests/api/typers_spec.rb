require "rails_helper"

RSpec.describe Api::TypersController do
  describe ".show" do
    it "returns valid response" do
      typer = create(:typer)

      get "/api/typers/#{typer.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/typers_controller/show/200")
    end
  end
end
