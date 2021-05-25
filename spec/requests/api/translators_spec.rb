require "rails_helper"

RSpec.describe Api::TranslatorsController do
  describe ".show" do
    it "returns valid response" do
      translator = create(:translator)

      get "/api/translators/#{translator.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/translators_controller/show/200")
    end
  end
end
