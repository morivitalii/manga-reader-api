require "rails_helper"

RSpec.describe Api::UsersController do
  describe ".index" do
    it "returns valid response" do
      first_user = create(:user, username: "AA")
      second_user = create(:user, username: "AB")
      third_user = create(:user, username: "AC")
      _fourth_user = create(:user, username: "AD")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/users.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/users_controller/index/200")
      expect(response).to have_objects_collection(first_user, second_user, third_user)
    end
  end

  describe ".show" do
    it "returns valid response" do
      user = create(:user)

      get "/api/users/#{user.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users_controller/show/200")
    end
  end
end
