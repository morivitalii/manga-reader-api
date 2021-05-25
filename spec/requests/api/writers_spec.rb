require "rails_helper"

RSpec.describe Api::WritersController do
  describe ".show" do
    it "returns valid response" do
      writer = create(:writer)

      get "/api/writers/#{writer.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/writers_controller/show/200")
    end
  end
end
