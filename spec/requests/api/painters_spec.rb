require "rails_helper"

RSpec.describe Api::PaintersController do
  describe ".show" do
    it "returns valid response" do
      painter = create(:painter)

      get "/api/painters/#{painter.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/painters_controller/show/200")
    end
  end
end
