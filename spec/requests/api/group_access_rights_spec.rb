require "rails_helper"

RSpec.describe Api::GroupAccessRightsController do
  describe ".index" do
    it "returns valid response" do
      first_group_access_right = create(:group_access_right)
      second_group_access_right = create(:group_access_right)

      get "/api/group_access_rights.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/group_access_rights_controller/index/200")
      expect(response).to have_objects_collection(first_group_access_right, second_group_access_right)
    end
  end

  describe ".show" do
    it "returns valid response" do
      group_access_right = create(:group_access_right)

      get "/api/group_access_rights/#{group_access_right.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/group_access_rights_controller/show/200")
    end
  end
end
