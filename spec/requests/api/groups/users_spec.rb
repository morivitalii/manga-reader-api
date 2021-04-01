require "rails_helper"

RSpec.describe Api::Groups::UsersController do
  describe ".index" do
    it "returns valid response" do
      group = create(:group)
      first_group_user = create(:group_user, group: group)
      second_group_user = create(:group_user, group: group)
      _other_group_user = create(:group_user)

      get "/api/groups/#{group.to_param}/users.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/groups/users_controller/index/200")
      expect(response).to have_objects_collection(first_group_user, second_group_user)
    end
  end

  describe ".show" do
    it "returns valid response" do
      group = create(:group)
      group_user = create(:group_user, group: group)

      get "/api/groups/#{group.to_param}/users/#{group_user.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/groups/users_controller/show/200")
    end
  end
end
