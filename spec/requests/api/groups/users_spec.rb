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

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      group = create(:group)
      _group_user = create(:group_user_with_manage_users_access_right, group: group, user: current_user)
      user = create(:user)
      access_right = create(:manage_group_access_right)

      params = {
        user_id: user.id,
        access_rights: [access_right.key]
      }

      post "/api/groups/#{group.to_param}/users.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/groups/users_controller/create/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      group = create(:group)
      _group_user = create(:group_user_with_manage_users_access_right, group: group, user: current_user)
      group_user = create(:group_user, group: group)
      access_right = create(:manage_group_access_right)

      params = {
        access_rights: [access_right.key]
      }

      put "/api/groups/#{group.to_param}/users/#{group_user.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/groups/users_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      group = create(:group)
      _group_user = create(:group_user_with_manage_users_access_right, group: group, user: current_user)
      group_user = create(:group_user, group: group)

      delete "/api/groups/#{group.to_param}/users/#{group_user.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
