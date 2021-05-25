require "rails_helper"

RSpec.describe Api::CleanersController do
  describe ".show" do
    it "returns valid response" do
      cleaner = create(:cleaner)

      get "/api/cleaners/#{cleaner.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/cleaners_controller/show/200")
    end
  end
end
