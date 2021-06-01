require "rails_helper"

RSpec.describe Api::AccessRightsController do
  describe ".index" do
    it "returns valid response" do
      first_access_right = create(:access_right)
      second_access_right = create(:access_right)

      get "/api/access_rights.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/access_rights_controller/index/200")
      expect(response).to have_objects_collection(first_access_right, second_access_right)
    end
  end

  describe ".show" do
    it "returns valid response" do
      access_right = create(:access_right)

      get "/api/access_rights/#{access_right.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/access_rights_controller/show/200")
    end
  end
end
