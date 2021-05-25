require "rails_helper"

RSpec.describe Api::EditorsController do
  describe ".show" do
    it "returns valid response" do
      editor = create(:editor)

      get "/api/editors/#{editor.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/editors_controller/show/200")
    end
  end
end
